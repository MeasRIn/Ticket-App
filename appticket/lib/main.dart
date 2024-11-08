import 'package:appticket/botttom_nav_bar/bottom_navigation.dart';
import 'package:appticket/signup_screen/signup_screen.dart';
import 'package:appticket/welcome/welcome_sceen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: WelcomeScreen());
  }
}
