import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/auth_services.dart';

class RegisterServices {
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final _services = AuthServices();

  Future<UserModel?> register(UserModel userModel) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
    } catch (e) {
      print(e);
    }
    UserModel? createdUser = await addUser(userModel);
    _services.updateStorage(createdUser!);
    return createdUser;
  }

  Future<UserModel?> addUser(UserModel userModel) async {
    try {
      final user = await _store.collection("users").add(userModel.toJson());
      userModel.key = user.id;
    } catch (e) {
      print(e);
    }
    return userModel;
  }
}
