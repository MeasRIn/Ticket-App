import 'package:appticket/datas_store/add_data_tofirebase.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<InfoScreen> {
  final FirebaseService firebaseService = FirebaseService();

  final id = TextEditingController();
  final name = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Information"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: id,
                  decoration: InputDecoration(
                    label: const Text("Id"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    label: const Text("Name"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: age,
                  decoration: InputDecoration(
                    label: const Text("Age"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: gender,
                  decoration: InputDecoration(
                    label: const Text("Gender"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    label: const Text("Phone"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      try {
                        firebaseService.addUser(
                          int.tryParse(id.text) ?? 0,
                          name.text,
                          int.tryParse(age.text) ?? 0,
                          gender.text,
                          int.tryParse(phone.text) ?? 0,
                          email.text,
                          password.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Success')),
                        );
                        id.clear();
                        name.clear();
                        age.clear();
                        gender.clear();
                        phone.clear();
                        email.clear();
                        password.clear();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: $e')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent),
                    child: const Text("Submit"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
