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
      height: 280,
      width: 380,
      child: Card(
        elevation: 8,
        color: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Airline and Flight Status Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(flightNumber,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text(airlineName,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text("En Route",
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey, thickness: 1),

              // Dates Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_circle_up,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        flightDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_circle_down,
                        size: 16,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        flightDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Locations Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(from,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  Text(to, style: const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    departureCode,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Transform.rotate(
                    angle: 1.57,
                    child: const Icon(
                      Icons.flight,
                      size: 50,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    arrivalCode,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Time Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Departure: $departureTime",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    "Arrival: $arrivalTime",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    typeOfChair,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    "USD $price",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> flightInfo = [
  {
    'departureCity': 'NRC',
    'arrivalCity': 'LDN',
    'departureTime': '10:00 AM',
    'arrivalTime': '1:30 PM',
    'flightDuration': '3h 30m',
    'airline': 'AirExample',
    'flightNumber': 'AX123',
    'flightDate': '2024-12-15',
    'departureCode': 'NRT',
    'arrivalCode': 'LHR',
    'typeOfChair': 'Economy',
    'price': '260'
  },
  {
    'departureCity': 'JFK',
    'arrivalCity': 'LAX',
    'departureTime': '8:00 AM',
    'arrivalTime': '11:15 AM',
    'flightDuration': '5h 15m',
    'airline': 'SkyHigh',
    'flightNumber': 'SH456',
    'flightDate': '2024-12-16',
    'departureCode': 'JFK',
    'arrivalCode': 'LAX',
    'typeOfChair': 'Economy',
    'price': '260'
  },
  {
    'departureCity': 'DXB',
    'arrivalCity': 'SIN',
    'departureTime': '9:30 PM',
    'arrivalTime': '5:45 AM',
    'flightDuration': '7h 15m',
    'airline': 'GlobalWings',
    'flightNumber': 'GW789',
    'flightDate': '2024-12-17',
    'departureCode': 'DXB',
    'arrivalCode': 'SIN',
    'typeOfChair': 'Economy',
    'price': '260'
  },
  {
    'departureCity': 'SYD',
    'arrivalCity': 'HND',
    'departureTime': '6:45 AM',
    'arrivalTime': '3:30 PM',
    'flightDuration': '8h 45m',
    'airline': 'PacificAir',
    'flightNumber': 'PA321',
    'flightDate': '2024-12-18',
    'departureCode': 'SYD',
    'arrivalCode': 'HND',
    'typeOfChair': 'Economy',
    'price': '260'
  },
  {
    'departureCity': 'SFO',
    'arrivalCity': 'CDG',
    'departureTime': '3:15 PM',
    'arrivalTime': '10:50 AM',
    'flightDuration': '10h 35m',
    'airline': 'EuroJet',
    'flightNumber': 'EJ567',
    'flightDate': '2024-12-19',
    'departureCode': 'SFO',
    'arrivalCode': 'CDG',
    'typeOfChair': 'Economy',
    'price': '260'
  },
  {
    'departureCity': 'ORD',
    'arrivalCity': 'MIA',
    'departureTime': '12:00 PM',
    'arrivalTime': '4:10 PM',
    'flightDuration': '4h 10m',
    'airline': 'AmeriFly',
    'flightNumber': 'AF234',
    'flightDate': '2024-12-20',
    'departureCode': 'ORD',
    'arrivalCode': 'MIA',
    'typeOfChair': 'Economy',
    'price': '260'
  },
];
