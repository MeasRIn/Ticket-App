import 'package:appticket/datas_store/database.dart';
import 'package:appticket/widget_show/card_flight.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:appticket/widget_show/detail_hotel_screen.dart';
import 'package:appticket/widget_show/view_all_flight.dart';
import 'package:appticket/widget_show/view_all_hotels.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      backgroundColor: const Color.fromARGB(230, 248, 245, 245),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateTime.now().hour < 12
                              ? "Good Morning"
                              : "Good Afternoon",
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Book Tickets",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Search Field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming Flights",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewAllFlight(),
                            ));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Flights ListView
                SizedBox(
                  height: 230,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: flightData.length,
                    itemBuilder: (context, index) {
                      final flights = flightData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                const SizedBox(height: 20),

                // Hotels Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hotels",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewAllHotels(),
                            ));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Hotels ListView
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotelsData.length,
                    itemBuilder: (context, index) {
                      final hotel = hotelsData[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailHotelScreen(
                                  title: hotel["title"]!,
                                  image: hotel["image"]!,
                                  price: hotel["price"]!,
                                  review: hotel["review"]!,
                                  subtitle: hotel["subtitle"]!,
                                  location: hotel["location"]!,
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
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
