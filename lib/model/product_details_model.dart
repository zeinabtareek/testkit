class ProductDetailsModel {
  String? image;
  String? name;
  int? price;
  int? rate;
  String? key;
  String? shortDescription;
  String? longDescription;

  ProductDetailsModel(
      { this.image,
        this.name,
        this.price,
        this.rate,
        this.longDescription,
        this.shortDescription,
        this.key});

  factory ProductDetailsModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return ProductDetailsModel(
      image: snapshot['image'],
      name: snapshot['name'],
      price: snapshot['price'],
      rate: snapshot['rate'],
      longDescription: snapshot['longDescription'],
      shortDescription: snapshot['shortDescription'],
    );
  }
  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['image'] = image;
    map['name'] = name;
    map['price'] = price;
    map['rate'] = rate;
    map['longDescription'] = longDescription;
    map['shortDescription'] = shortDescription;
    return map;
  }
}
