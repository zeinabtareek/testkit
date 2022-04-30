import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/user_model.dart';
import 'package:newapexproject/screens/home/home.dart';
import 'package:newapexproject/screens/login_screen/login_screen.dart';
import 'package:newapexproject/services/auth_services.dart';

class AuthController extends BaseController {
  static AuthController to = Get.find();
  final _isLogged = false.obs;
  final _currentUser = UserModel().obs;
  final _services = AuthServices();

  bool get isLogged => _isLogged.value;

  UserModel get currentUser => _currentUser.value;

  @override
  Future<void> onInit() async {
    ever(_isLogged, handleAuthChange);
    var user = await _services.getCurrentUser();
    if (user != null) {
      _currentUser.value = user;
      _isLogged.value = true;
    } else {
      _isLogged.value = false;
    }
  }

  handleAuthChange(isLoggedIn) async {
    await Future.delayed(Duration(seconds: 1));
    if (isLoggedIn) {
      Get.offAll((() => Home()));
    } else {
      Get.offAll((() => LoginScreen()));
    }
  }

  changeLoggedIn(bool isLogged, UserModel userModel) {
    if (isLogged) {
      _currentUser.value = userModel;
      Get.offAll((() => Home()));
    } else {
      Get.offAll((() => LoginScreen()));
    }
  }

  logOut() {
    _services.signOut();
  }
}
