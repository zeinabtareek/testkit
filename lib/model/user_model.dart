import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? password;
  String? phone;
  String? image;
  String? key;

  UserModel(
      {this.email, this.password, this.name, this.phone, this.image, this.key});

  factory UserModel.fromJson(DocumentSnapshot snapShot) {
    return UserModel(
        email: snapShot['email'],
        name: snapShot['name'],
        password: snapShot['password'],
        phone: snapShot['phone'],
        image: snapShot["image"],
        key: snapShot.id);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['image'] = image;
    map['password'] = password;
    map['phone'] = phone;
    return map;
  }
}
