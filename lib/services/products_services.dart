import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newapexproject/model/products_model.dart';

class CategoryServices {
  final _store = FirebaseFirestore.instance;

  Future<List<ProductModel>> getCategoryDocs(String id, String key) async {
    final data = await _store
        .collection('category')
        .doc(id)
        .collection('data')
        .doc(key)
        .collection('products')
        .get();
    print(data.size);
    return data.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  }


Future<List<ProductModel>> seeAll(String id)async{
  final data=await _store.collection('category')
      .doc(id)
      .collection('data')
      .get();
  return data.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  }
}
