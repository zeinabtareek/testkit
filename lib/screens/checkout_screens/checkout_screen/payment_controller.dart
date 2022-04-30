
import 'package:get/get.dart';
import '../../../controller/base_controller.dart';

class PaymentController extends BaseController {

  // final check=false.obs;
  final value1=0.obs;

  isChecked(int value){
    value1.value = value;
  }

}