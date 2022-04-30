import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:newapexproject/model/banner_model.dart';
import 'package:newapexproject/model/category_model.dart';
import 'package:newapexproject/model/products_model.dart';

class HomeServices {
  final _store = FirebaseFirestore.instance;
  final Dio _dio = Dio();

  Future<List<CategoryModel>> getCategory() async {
    final data = await _store.collection('category').get();
    return data.docs.map((e) => CategoryModel.fromJson(e)).toList();
  }

  Future<List<CategoryModel>> getCategoryDocs(String id) async {
    final data =
        await _store.collection('category').doc(id).collection('data').orderBy('name',descending: false).get();
    print(data.size);
    return data.docs.map((e) => CategoryModel.fromJson(e)).toList();
  }


  Future<BannerModel> getBanner() async {
    Response response =
        await _dio.get('https://student.valuxapps.com/api/banners');
    print(response.data);
    return BannerModel.fromJson(response.data);
  }

  Future<List<ProductModel>> getProduct() async {
    final data = await _store.collection('product').get();
    return data.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
  }
}
