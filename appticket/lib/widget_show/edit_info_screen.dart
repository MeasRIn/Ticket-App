import 'package:appticket/screen/profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userFullName),
      ),
    );
  }
}
