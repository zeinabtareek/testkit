import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapexproject/component/image_dialoge.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/profile_services.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends BaseController {
  final _services = ProfileServices();
  final _picker = ImagePicker();
  final _imgPath = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  String get imgPath => _imgPath.value;

  final List<String> labels = [
    'My Orders',
    'Payment Methods',
    'Shipping Addresses',
    'My Wishlist',
    'Change Password',
    'Log Out'
  ];
  final List<String> subTitle = [
    'Already have 12 order',
    'visa **43',
    '3 addresses',
    '',
    '',
    ''
  ];
  final List<IconData> icons = [
    Icons.shopping_bag_outlined,
    Icons.payment,
    Icons.share_location_outlined,
    Icons.favorite_border_outlined,
    Icons.lock_outline,
    Icons.logout
  ];

  Future<bool> requestImagePermission() async {
    if (Platform.isAndroid) {
      Permission.camera.request().isGranted;
      Permission.storage.request().isGranted;
      return true;
    } else if (Platform.isIOS) {
      Permission.camera.request().isGranted;
      Permission.photos.request().isGranted;
      return true;
    }
    return false;
  }

  chooseProfileImage() async {
    final status = await requestImagePermission();
    if (status) {
      if (_imgPath.value.isEmpty || _imgPath.value == '') {
        try {
          final isGallery = await Get.dialog(const ChooseImageDialog());
          XFile? image;
          if (isGallery != null && isGallery == true) {
            image = await _picker.pickImage(source: ImageSource.gallery);
          } else if (isGallery != null && isGallery == false) {
            image = await _picker.pickImage(source: ImageSource.camera);
          }
          if (image != null) _imgPath.value = image.path;
          await updateProfileImage();
        } catch (e) {
          print(e);
        }
      } else {
        final isGallery = await Get.dialog(const ChooseImageDialog());
        XFile? image;
        if (isGallery != null && isGallery == true) {
          image = await _picker.pickImage(source: ImageSource.gallery);
        } else if (isGallery != null && isGallery == false) {
          image = await _picker.pickImage(source: ImageSource.camera);
        }
        if (image != null) _imgPath.value = image.path;
        await updateProfileImage();
      }
    } else {
      print("error");
    }
  }

  UpdatePassword() async {
    UserModel userModel = await _services.updatePassword(UserModel(
        name: AuthController.to.currentUser.name,
        email: AuthController.to.currentUser.email,
        phone: AuthController.to.currentUser.phone,
        password: confirmPassword.value,
        image: AuthController.to.currentUser.image));
    return userModel;
  }

  updateProfileImage() async {
    UserModel userModel = await _services.updateImage(
        UserModel(
            name: AuthController.to.currentUser.name,
            email: AuthController.to.currentUser.email,
            phone: AuthController.to.currentUser.phone,
            password: AuthController.to.currentUser.password,
            image: _imgPath.value),
        _imgPath.value);
    return userModel;
  }
}
