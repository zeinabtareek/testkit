import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? name;
  String? key;

  CategoryModel({this.key, this.name});

  factory CategoryModel.fromJson(DocumentSnapshot snapshot) {
    return CategoryModel(name: snapshot['name'], key: snapshot.id);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }
}
