import 'package:appticket/photo_list/image_list.dart';
import 'package:appticket/widget_show/card_flight.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:appticket/widget_show/detail_hotel_screen.dart';
import 'package:cr_calendar/cr_calendar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isAirlineSelected = true; //swap tap
  CrCalendarController _controller = CrCalendarController();
  TextEditingController _entryDateController = TextEditingController();
  TextEditingController _leaveDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _leaveDateController.text = "${picked.toLocal()}".split(' ')[0];
        _entryDateController.text = "${picked.toLocal()}".split(' ')[0];
        _controller.goToDate(picked); // Move the calendar to the selected date
      });
    }
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
                  width: 390,
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
                          width: 195,
                          decoration: BoxDecoration(
                            color: isAirlineSelected
                                ? Colors.blueGrey
                                : Colors.transparent,
                            borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(30)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
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
                          width: 195,
                          decoration: BoxDecoration(
                            color: isAirlineSelected
                                ? Colors.transparent
                                : Colors.blueGrey,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(30)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
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

                // Conditional Content based on selected tab
                if (isAirlineSelected)
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                        width: 390,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Find Tickets",
                              style: TextStyle(
                                fontSize: 20,
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Upcoming Flights",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            InkWell(
                                onTap: () {}, child: const Text("View All")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: flightInfo.length,
                          itemBuilder: (context, index) {
                            final flights = flightInfo[index];
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                            onTap: () => _selectDate(context),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
                            onTap: () => _selectDate(context),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 390,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              "Find Hotels",
                              style: TextStyle(
                                fontSize: 20,
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hotels",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text("View all"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: hotels.length,
                              itemBuilder: (context, index) {
                                final hotel = hotels[index];
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
