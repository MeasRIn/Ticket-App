import 'package:flutter/material.dart';

Widget ticketBooking() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 228, 223, 223),
                  Color.fromARGB(255, 232, 235, 235)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: Card(
              elevation: 7,
              // color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Center(
                        child: Text(
                          'BOARDING PASS',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                    const Divider(thickness: 1, color: Colors.blueGrey),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "SEAT",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              Text(
                                "12A",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                          Transform.rotate(
                            angle: 3.14159 / 5,
                            child: const Icon(
                              Icons.flight,
                              color: Colors.blueGrey,
                              size: 100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name of Passenger",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          Text(
                            "Meas Rin",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "FLIGHT :",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "GATE :",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TIME :",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                          Text(
                            "DATE :",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "NOE",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Transform.rotate(
                            angle: 3.14159 / 2,
                            child: const Icon(
                              Icons.flight,
                              color: Colors.blueGrey,
                              size: 30,
                            ),
                          ),
                          const Text(
                            "NBP",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Image.asset(
                              "assets/images/barcode/codebar.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Text(
                          "NO.123344416835",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Decorative Cutouts
          const Positioned(
            left: -8,
            top: 360,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromARGB(230, 236, 236, 236),
            ),
          ),
          const Positioned(
            right: -8,
            top: 360,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Color.fromARGB(230, 236, 236, 236),
            ),
          ),
          Positioned(
            left: 5,
            top: 370,
            child: dot(),
          ),
        ],
      ),
    ),
  );
}

Widget dot() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        37,
        (index) => Container(
          width: 10,
          height: 1,
          color: index % 2 == 0 ? Colors.transparent : Colors.blueGrey,
        ),
      ),
    );
