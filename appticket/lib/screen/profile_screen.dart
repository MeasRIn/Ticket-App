import 'package:appticket/widget_show/build_card.dart';
import 'package:flutter/material.dart';
import 'package:appticket/widget_show/detail_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

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
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Image.asset("assets/images/user.png"),
                        ),
                        const Text("User Name"),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child:
                        const Center(child: Text("Your Profile Details Here")),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: Column(
                    children: [
                      buildCard(
                        context,
                        icon: Icons.person,
                        title: "My Profile",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailProfileScreen(
                                  title: "My Profile"),
                            ),
                          );
                        },
                      ),
                      buildCard(
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
                        context,
                        icon: Icons.language,
                        title: "Language",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailProfileScreen(title: "Language"),
                            ),
                          );
                        },
                      ),
                      buildCard(
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
                                content: const Text(
                                    "Are you sure, You want to delete account"),
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
                                      child:const  Text("Yes"))
                                ],
                              );
                            },
                          );
                        },
                      ),
                      buildCard(
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
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "Log Out",
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
