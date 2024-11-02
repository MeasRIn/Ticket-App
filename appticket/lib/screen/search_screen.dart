import 'package:appticket/photo_list/image_list.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isAirlineSelected = true; // Track selected tab

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
                                ? const Color.fromARGB(255, 202, 202, 202)
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
                                : const Color.fromARGB(255, 202, 202, 202),
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
                            backgroundColor: Colors.blueAccent,
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
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Upcoming Flights",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          InkWell(onTap: () {}, child: const Text("View All")),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: flights.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                width: 360,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(flights[index]),
                                    fit: BoxFit.cover,
                                  ),
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
                              labelText: "Entry Date",
                              border: InputBorder.none,
                              icon: Icon(Icons.event),
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
                              labelText: "Leave Date",
                              border: InputBorder.none,
                              icon: Icon(Icons.logout),
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
                            backgroundColor: Colors.blueAccent,
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
                              itemCount: hotel.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: CardHotel(
                                    image: hotel[index],
                                    title: "Hotel",
                                    subtitle: "Loy",
                                    review: "4",
                                    price: "100\$",
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
