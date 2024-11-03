import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserData {
  int? id;
  String? name;
  int? age;
  String? gender;
  int? phone;
  String? email;
  String? password;
  UserData({
    this.id,
    this.name,
    this.age,
    this.gender,
    this.phone,
  });

  Map<String, dynamic> toFirebase() {
    return {
      'id': Autocomplete,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'time': Timestamp.now(),
    };
  }

  UserData.fromFireBase(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        age = map['age'],
        gender = map['gender'],
        phone = map['phone'];
}
