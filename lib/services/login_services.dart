import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';
import 'package:newapexproject/utilis/alert.dart';

class LoginServices {
  final _auth = FirebaseAuth.instance;
  final _Store = FirebaseFirestore.instance;
  final _services = AuthServices();

  Future<UserModel> login(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
    UserModel createdUser = await getUserByEmail(password, email, context);
    _services.updateStorage(createdUser);
    return createdUser;
  }

  Future<UserModel> getUserByEmail(
      String password, String email, BuildContext context) async {
    final data = await _Store.collection("users")
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .get();
    if (data.docs.length > 0) {
      return UserModel.fromJson(data.docs.first);
    }
    throw Utility.displayErrorAlert(
        "Wrong to find your Email !", "Error", context);
  }
}
