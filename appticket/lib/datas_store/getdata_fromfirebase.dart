class UserData {
  int? id;
  String? name;
  int? age;
  String? gender;
  int? phone;
  String? email;
  String? password;
  UserData(
      {this.id,
      this.name,
      this.age,
      this.gender,
      this.phone,
      this.email,
      this.password});

  Map<String, dynamic> toFirebase() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'phone': phone,
      'email': email,
      'password': password
    };
  }

  UserData.fromFireBase(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        age = map['age'],
        gender = map['gender'],
        phone = map['phone'],
        email = map['email'],
        password = map['password'];
}
