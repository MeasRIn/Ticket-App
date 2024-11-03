import 'package:flutter/material.dart';

class DetailProfileScreen extends StatelessWidget {
  final String title;
  const DetailProfileScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text("Details not yet implemented."),
      ),
    );
  }
}
