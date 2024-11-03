import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(
    int id,
    String name,
    int age,
    String gender,
    int phone,
  ) async {
    try {
      await _firestore.collection('user').doc().set({
        'id': id,
        'name': name,
        'age': age,
        'gender': gender,
        'phone': phone,
      });
      print("User added successfully!");
    } catch (e) {
      print("Error adding user: $e");
    }
  }
}
