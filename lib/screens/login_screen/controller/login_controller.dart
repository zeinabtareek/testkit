import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/login_services.dart';

class LoginController extends BaseController {
  final _services = LoginServices();
  final _email = ''.obs;
  final _password = ''.obs;
  final check = false.obs;

  String get email => _email.value;

  String get password => _password.value;

  validEmail(String email) {
    _email.value = email;
  }

  validPassword(String password) {
    _password.value = password;
  }

  log(BuildContext context) async {
    check.value = true;
    UserModel? user = await _services.login(email, password, context);
    AuthController.to.changeLoggedIn(true, user);
    check.value = !check.value;
  }
}
