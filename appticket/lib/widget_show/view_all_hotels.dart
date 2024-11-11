import 'package:appticket/datas_store/database.dart';
import 'package:appticket/widget_show/card_flight.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:appticket/widget_show/detail_hotel_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewAllHotels extends StatefulWidget {
  const ViewAllHotels({super.key});

  @override
  _ViewAllHotelsState createState() => _ViewAllHotelsState();
}

class _ViewAllHotelsState extends State<ViewAllHotels> {
  final FlightService flightService = FlightService();

  List<Map<String, dynamic>> hotelsData = [];

  @override
  void initState() {
    super.initState();

    fetchHotelsData();
  }

  Future<void> fetchHotelsData() async {
    hotelsData = await flightService.getHotels();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotels Information"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: hotelsData.length,
          itemBuilder: (context, index) {
            final hotel = hotelsData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        location: hotel["location"],
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
    );
  }
}
