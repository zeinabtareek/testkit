import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/model/user_model.dart';

class ProfileServices {
  final _store = FirebaseFirestore.instance;

  Future<UserModel> updateImage(UserModel userModel, String image) async {
    if (image.length != null && image.isNotEmpty) {
      userModel.image = await uploadImage(image, "123456789");
    }
    final ref = await _store
        .collection("users")
        .doc(AuthController.to.currentUser.key)
        .update(userModel.toJson());
    print("nbbbb");
    return userModel;
  }

  Future<UserModel> updatePassword(UserModel userModel) async {
    final ref = await _store
        .collection("users")
        .doc(AuthController.to.currentUser.key)
        .update(userModel.toJson());
    print("nbbbb");
    return userModel;
  }

  Future<String> uploadImage(String imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }
}
