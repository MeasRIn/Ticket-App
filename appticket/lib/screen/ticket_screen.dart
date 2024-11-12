import 'package:appticket/widget_show/ticket_booking.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  Widget _buildEmptySection(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 139, 139, 139)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 236, 236, 236),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: const Text(
                  "Tickets",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.blueGrey,
                      tabs: [
                        Tab(
                          child: Text("Coming soon",
                              style: TextStyle(fontSize: 16)),
                        ),
                        Tab(
                          child: Text("Past", style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: TabBarView(
                        children: [
                          ticketBooking(),
                          _buildEmptySection("No items yet"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
