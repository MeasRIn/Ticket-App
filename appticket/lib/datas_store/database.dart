import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  Future addUsers(Map<String, dynamic> userInfoMap, String id) async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .set(userInfoMap);
  }

  Future<Map<String, dynamic>?> getUserById(String id) async {
    try {
      DocumentSnapshot docSnapshot =
          await FirebaseFirestore.instance.collection("user").doc(id).get();

      if (docSnapshot.exists) {
        return docSnapshot.data() as Map<String, dynamic>?;
      } else {
        print('User not found.');
        return null;
      }
    } catch (e) {
      print('Failed to fetch user data: $e');
      return null;
    }
  }
}
