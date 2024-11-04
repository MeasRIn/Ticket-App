import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Setting"),
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: const Color.fromARGB(230, 248, 248, 248),
        body: const Center(
          child: Text("not yet!"),
        ));
  }
}
