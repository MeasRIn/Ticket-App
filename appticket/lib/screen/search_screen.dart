import 'package:appticket/datas_store/database.dart';
import 'package:appticket/widget_show/card_flight.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:appticket/widget_show/detail_hotel_screen.dart';
import 'package:appticket/widget_show/view_all_flight.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isAirlineSelected = true;
  TextEditingController _entryDateController = TextEditingController();
  TextEditingController _leaveDateController = TextEditingController();

  Future<DateTime> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    return picked!;
  }

  final FlightService flightService = FlightService();
  List<Map<String, dynamic>> flightData = [];
  List<Map<String, dynamic>> hotelsData = [];

  @override
  void initState() {
    super.initState();
    fetchFlightData();
    fetchHotelsData();
  }

  Future<void> fetchFlightData() async {
    flightData = await flightService.getFlights();
    setState(() {});
  }

  Future<void> fetchHotelsData() async {
    hotelsData = await flightService.getHotels();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 248, 248, 248),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "What are\n you looking for?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Toggle Tab
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color.fromARGB(255, 224, 224, 224),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Airline Tab
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAirlineSelected = true;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                            color: isAirlineSelected
                                ? Colors.blueGrey
                                : Colors.transparent,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: Text(
                                "Airline",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Hotels Tab
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAirlineSelected = false;
                          });
                        },
                        child: Container(
                          height: 40,
                          width: 170,
                          decoration: BoxDecoration(
                            color: isAirlineSelected
                                ? Colors.transparent
                                : Colors.blueGrey,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(20),
                                left: Radius.circular(20)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                              child: Text(
                                "Hotels",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                // flight section
                if (isAirlineSelected)
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Departure",
                              border: InputBorder.none,
                              icon: Icon(Icons.flight_takeoff),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: "Arrival",
                              border: InputBorder.none,
                              icon: Icon(Icons.flight_land),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Find Tickets",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      // flight section
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Upcoming Flights",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllFlight(),
                                      ));
                                },
                                child: const Text("View All")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: flightData.length,
                          itemBuilder: (context, index) {
                            final flights = flightData[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {},
                                child: CardFlight(
                                  from: flights["departureCity"]!,
                                  to: flights["arrivalCity"]!,
                                  departureTime: flights["departureTime"]!,
                                  arrivalTime: flights["arrivalTime"]!,
                                  flightDuration: flights["flightDuration"]!,
                                  airlineName: flights["airline"]!,
                                  flightNumber: flights["flightNumber"]!,
                                  flightDate: flights["flightDate"]!,
                                  departureCode: flights["departureCode"]!,
                                  arrivalCode: flights["arrivalCode"]!,
                                  typeOfChair: flights["typeOfChair"]!,
                                  price: flights["price"]!,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      // selected date for entry
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: _entryDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Entry Date',
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.event,
                                color: Colors.blueGrey,
                              ),
                            ),
                            onTap: () async {
                              await selectDate().then(
                                (value) {
                                  setState(() {
                                    _entryDateController.text =
                                        "${value.toLocal()}".split(' ')[0];
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // selected date for leave
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextField(
                            controller: _leaveDateController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              labelText: 'Leave Date',
                              labelStyle: TextStyle(color: Colors.blueGrey),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.event,
                                color: Colors.blueGrey,
                              ),
                            ),
                            onTap: () async {
                              await selectDate().then(
                                (value) {
                                  setState(() {
                                    _leaveDateController.text =
                                        "${value.toLocal()}".split(' ')[0];
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Find Hotels",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hotels",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("View all"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: hotelsData.length,
                              itemBuilder: (context, index) {
                                final hotel = hotelsData[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DetailHotelScreen(
                                            title: hotel["title"]!,
                                            image: hotel["image"]!,
                                            price: hotel["price"]!,
                                            review: hotel["review"]!,
                                            subtitle: hotel["subtitle"]!,
                                          ),
                                        ),
                                      );
                                    },
                                    child: CardHotel(
                                      image: hotel["image"]!,
                                      title: hotel["title"]!,
                                      subtitle: hotel["subtitle"]!,
                                      review: hotel["review"]!,
                                      price: hotel["price"]!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
