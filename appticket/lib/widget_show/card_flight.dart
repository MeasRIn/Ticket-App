import 'package:flutter/material.dart';

class CardFlight extends StatelessWidget {
  final String departureTime;
  final String arrivalTime;
  final String flightDuration;
  final String airlineName;
  final String from;
  final String to;
  final String flightNumber;
  final String flightDate;
  final String departureCode;
  final String arrivalCode;
  final String typeOfChair;
  final String price;

  const CardFlight({
    super.key,
    required this.airlineName,
    required this.arrivalTime,
    required this.departureTime,
    required this.flightDuration,
    required this.from,
    required this.to,
    required this.flightNumber,
    required this.flightDate,
    required this.arrivalCode,
    required this.departureCode,
    required this.typeOfChair,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: 380,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo.shade600, Colors.cyan.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Airline and Flight Information
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            departureCode,
                            style: TextStyle(
                              color: Colors.indigo.shade800,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            airlineName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            flightNumber,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "On Time",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Flight Route with Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    departureTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.flight_takeoff,
                      color: Colors.white70, size: 28),
                  Text(
                    arrivalTime,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "$from ➔ $to",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Flight Date and Duration
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flightDate,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    flightDuration,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Seating and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    typeOfChair,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "USD $price",
                    style: const TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> flightInfo = [
//   {
//     'departureCity': 'NRC',
//     'arrivalCity': 'LDN',
//     'departureTime': '10:00 AM',
//     'arrivalTime': '1:30 PM',
//     'flightDuration': '3h 30m',
//     'airline': 'AirExample',
//     'flightNumber': 'AX123',
//     'flightDate': '2024-12-15',
//     'departureCode': 'NRT',
//     'arrivalCode': 'LHR',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
//   {
//     'departureCity': 'JFK',
//     'arrivalCity': 'LAX',
//     'departureTime': '8:00 AM',
//     'arrivalTime': '11:15 AM',
//     'flightDuration': '5h 15m',
//     'airline': 'SkyHigh',
//     'flightNumber': 'SH456',
//     'flightDate': '2024-12-16',
//     'departureCode': 'JFK',
//     'arrivalCode': 'LAX',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
//   {
//     'departureCity': 'DXB',
//     'arrivalCity': 'SIN',
//     'departureTime': '9:30 PM',
//     'arrivalTime': '5:45 AM',
//     'flightDuration': '7h 15m',
//     'airline': 'GlobalWings',
//     'flightNumber': 'GW789',
//     'flightDate': '2024-12-17',
//     'departureCode': 'DXB',
//     'arrivalCode': 'SIN',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
//   {
//     'departureCity': 'SYD',
//     'arrivalCity': 'HND',
//     'departureTime': '6:45 AM',
//     'arrivalTime': '3:30 PM',
//     'flightDuration': '8h 45m',
//     'airline': 'PacificAir',
//     'flightNumber': 'PA321',
//     'flightDate': '2024-12-18',
//     'departureCode': 'SYD',
//     'arrivalCode': 'HND',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
//   {
//     'departureCity': 'SFO',
//     'arrivalCity': 'CDG',
//     'departureTime': '3:15 PM',
//     'arrivalTime': '10:50 AM',
//     'flightDuration': '10h 35m',
//     'airline': 'EuroJet',
//     'flightNumber': 'EJ567',
//     'flightDate': '2024-12-19',
//     'departureCode': 'SFO',
//     'arrivalCode': 'CDG',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
//   {
//     'departureCity': 'ORD',
//     'arrivalCity': 'MIA',
//     'departureTime': '12:00 PM',
//     'arrivalTime': '4:10 PM',
//     'flightDuration': '4h 10m',
//     'airline': 'AmeriFly',
//     'flightNumber': 'AF234',
//     'flightDate': '2024-12-20',
//     'departureCode': 'ORD',
//     'arrivalCode': 'MIA',
//     'typeOfChair': 'Economy',
//     'price': '260'
//   },
// ];
