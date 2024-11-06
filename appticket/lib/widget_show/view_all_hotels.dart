import 'package:appticket/widget_show/card_flight.dart';
import 'package:appticket/widget_show/card_hotel.dart';
import 'package:appticket/widget_show/detail_hotel_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewAllHotels extends StatelessWidget {
  const ViewAllHotels({super.key});

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
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            final hotel = hotels[index];
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
