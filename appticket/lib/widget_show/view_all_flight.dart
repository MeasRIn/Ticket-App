import 'package:appticket/widget_show/card_flight.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ViewAllFlight extends StatelessWidget {
  const ViewAllFlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flight Information"),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: flightInfo.length,
          itemBuilder: (context, index) {
            final flights = flightInfo[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: InkWell(
                onTap: () {
                  // Add navigation to flight details here
                  // Example:
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => FlightDetailScreen(flight: flights)),
                  // );
                },
                child: CardFlight(
                  flightDate: flights["flightDate"],
                  flightNumber: flights["flightNumber"],
                  from: flights["departureCity"]!,
                  to: flights["arrivalCity"]!,
                  arrivalTime: flights["departureTime"]!,
                  departureTime: flights["arrivalTime"]!,
                  flightDuration: flights["flightDuration"]!,
                  airlineName: flights["airline"]!,
                  arrivalCode: flights["arrivalCode"],
                  departureCode: flights["departureCode"],
                  typeOfChair: flights["typeOfChair"],
                  price: flights["price"],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
