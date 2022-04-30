import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? image;
  String? name;
  int? price;
  String? discount;
  int? rate;
  String? key;
  bool? inStock;
  List? images;
  List? colors;
  String? description;

  ProductModel(
      {this.image,
      this.name,
      this.discount,
      this.price,
      this.images,
      this.description,
      this.rate,
      this.colors,
      this.inStock,
      this.key});

  factory ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    return ProductModel(
        image: snapshot['image'],
        name: snapshot['name'],
        price: snapshot['price'],
        rate: snapshot['rate'],
        discount: snapshot['discount'],
        inStock: snapshot['inStock'],
        description: snapshot['description'],
        images: snapshot['images'],
        colors: snapshot['colors'],
        key: snapshot.id);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['price'] = price;
    map['rate'] = rate;
    map['inStock'] = inStock;
    return map;
  }
}
