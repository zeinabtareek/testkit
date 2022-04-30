import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';

class ProductDetailsController extends BaseController {
  final boardController = PageController();
  final isLast = false.obs;
  final isFirst = true.obs;
  final check = false.obs;
  final currentIndex = 0.obs;

  final List<String> labels = [
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
    'https://images.footlocker.com/is/image/FLEU/317976172780_01?wid=519&hei=519&fmt=png-alpha',
  ];

  isLastFunction(int index) {
    if (index == labels.length - 1) {
      isLast.value = true;
    } else {
      isLast.value = false;
    }
  }

  isFirstFunction(int index) {
    if (index == labels.length - (labels.length - 1)) {
      isFirst.value = true;
    } else {
      isFirst.value = false;
    }
  }

  checkFun() {
    check.value = !check.value;
  }

  @override
  void onInit() {
    super.onInit();
    isFirstFunction(0);
  }
}
