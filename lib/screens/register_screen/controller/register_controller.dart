import 'package:get/get.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/services/register_services.dart';

class RegisterController extends BaseController {
  final services = RegisterServices();
  final _name = ''.obs;
  final _email = ''.obs;
  final _phone = ''.obs;
  final _password = ''.obs;
  final check = false.obs;

  String get name => _name.value;

  String get email => _email.value;

  String get phone => _phone.value;

  String get password => _password.value;

  validName(String name) {
    _name.value = name;
  }

  validPhone(String phone) {
    _phone.value = phone;
  }

  validEmail(String email) {
    _email.value = email;
  }

  validPassword(String password) {
    _password.value = password;
  }

  register() async {
    check.value = true;
    UserModel? user = await services.register(
        UserModel(email: email, phone: phone, password: password, name: name));
    AuthController.to.changeLoggedIn(true, user!);
    check.value = false;
  }
}
