import 'package:appticket/signup_screen/login_screen.dart';
import 'package:appticket/widget_show/build_card.dart';
import 'package:appticket/widget_show/card_profile.dart';
import 'package:appticket/widget_show/detail_myprofile_screen.dart';
import 'package:appticket/widget_show/language_screen.dart';
import 'package:appticket/widget_show/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:appticket/widget_show/detail_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

String? userEmail;
String? userFullName;
String? userPhoneNumber;
String? userBalance;
String? userBirth;

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(230, 248, 248, 248),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "My Account",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.blueGrey),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ));
                      },
                      icon: const Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              UserProfileCard(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: Column(
                    children: [
                      buildCard(
                        textColor: "0xFF607D8B",
                        color: "0xFF607D8B",
                        context,
                        icon: Icons.person,
                        title: "My Profile",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailMyprofileScreen(),
                            ),
                          );
                        },
                      ),
                      buildCard(
                        textColor: "0xFF607D8B",
                        color: "0xFF607D8B",
                        context,
                        icon: Icons.wallet,
                        title: "Wallet",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailProfileScreen(title: "Wallet"),
                            ),
                          );
                        },
                      ),
                      buildCard(
                        textColor: "0xFF607D8B",
                        color: "0xFF607D8B",
                        context,
                        icon: Icons.language,
                        title: "Language",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LanguageScreen(title: "Language")),
                          );
                        },
                      ),
                      buildCard(
                        textColor: "0xFF607D8B",
                        color: "0xFF607D8B",
                        context,
                        icon: Icons.call,
                        title: "Contact Us",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailProfileScreen(
                                  title: "Contact Us"),
                            ),
                          );
                        },
                      ),
                      buildCard(
                        textColor: "0xFF607D8B",
                        color: "0xFF607D8B",
                        context,
                        icon: Icons.delete_sharp,
                        title: "Delete Account",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 197, 198, 199),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                content: const Text(
                                  "Are you sure, You want to delete account",
                                  style: TextStyle(fontSize: 16),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          backgroundColor: Colors.redAccent),
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              );
                            },
                          );
                        },
                      ),
                      buildCard(
                        textColor: "0xFFF11C1C",
                        color: "0xFFF11C1C",
                        context,
                        icon: Icons.logout,
                        title: "Log Out",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 197, 198, 199),
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                title: const Text(
                                  "Confirm Log Out",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 115, 60)),
                                ),
                                content: const Text(
                                    "Are you sure you want to log out?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Cancel",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        backgroundColor: Colors.redAccent),
                                    child: const Text(
                                      "Log Out",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
