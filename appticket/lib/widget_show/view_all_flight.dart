import 'package:appticket/datas_store/database.dart';
import 'package:appticket/widget_show/card_flight.dart';
import 'package:flutter/material.dart';

class ViewAllFlight extends StatefulWidget {
  ViewAllFlight({super.key});

  @override
  _ViewAllFlightState createState() => _ViewAllFlightState();
}

class _ViewAllFlightState extends State<ViewAllFlight> {
  final FlightService flightService = FlightService();
  List<Map<String, dynamic>> flightData = [];

  @override
  void initState() {
    super.initState();
    fetchFlightData();
  }

  Future<void> fetchFlightData() async {
    flightData = await flightService.getFlights();
    setState(() {});
  }

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
          itemCount: flightData.length,
          itemBuilder: (context, index) {
            final flights = flightData[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: InkWell(
                onTap: () {},
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
