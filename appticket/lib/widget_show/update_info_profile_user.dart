// ignore_for_file: use_build_context_synchronously

import 'package:appticket/datas_store/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class UpdateInfoProfileUser extends StatefulWidget {
  const UpdateInfoProfileUser({super.key});

  @override
  State<UpdateInfoProfileUser> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<UpdateInfoProfileUser> {
  final name = TextEditingController();
  final email = TextEditingController();
  final birth = TextEditingController();
  final phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Complex your information:",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    label: Text("Name"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: birth,
                  decoration: const InputDecoration(
                    label: Text("Birthday"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    label: Text("Phone"),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Inside the UpdateInfoProfileUser class
                SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () async {
                      String id = randomAlphaNumeric(6);
                      Map<String, dynamic> userInfoMap = {
                        'id': id,
                        'name': name.text,
                        'email': email.text,
                        'birth': birth.text, 
                        'phone': phone.text
                      };

                      try {
                        await Database().addUsers(userInfoMap, id);

                        // Return data to the previous screen
                        Navigator.pop(context, userInfoMap);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Successfully saved!'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed: $e'),
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Save",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
