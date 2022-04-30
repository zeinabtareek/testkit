import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';

class HomeController extends BaseController {
  final _selectIndex = 0.obs;

  int get selectIndex => _selectIndex.value;

  select(int index) {
    _selectIndex.value = index;
  }
}
