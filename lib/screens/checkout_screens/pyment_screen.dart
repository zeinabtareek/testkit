import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import '../../component/payment_list_tile.dart';
import '../../constant.dart';
import '../cart_screen/cart_screen.dart';
import 'checkout_screen.dart';
import 'checkout_screen/payment_controller.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key? key}) : super(key: key);

  final _controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        label: "Payment",
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
                icon: const Icon(
                  EvaIcons.homeOutline,
                  color: K.mainColor,
                  size: 30,
                ),
                onPressed: () {}),
          ),
          K.sizedBoxW,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0, right: 20.0),
          child: Obx(()=>
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                K.sizedBoxH,
                Text(
                  'Payment Methods , multiple options to select what seems compatible for you',
                  style: const TextStyle(color: K.blackColor),),
                Text(
                  '\nChoose your payment method',
                  style:  const TextStyle(color: K.grayColor),),
                K.sizedBoxH,
                PaymentListTile(
                  label: '\nCash on Delivery',
                  onChanged: ( value) {
                    _controller.isChecked(value!);
                  },
                  image: 'assets/images/cash.png',
                  value: 1,
                  groupValue: _controller.value1.value,
                ), PaymentListTile(
                  label: '\n ',
                  onChanged: ( value) {
                    _controller.isChecked(value!);
                  },
                  image: 'assets/images/paypal.png',
                  value:2,
                  groupValue:  _controller.value1.value,

                ),
                PaymentListTile(
                  label: '\n ',
                  value: 3,
                  groupValue: _controller.value1.value,
                  onChanged: ( value) {
                    _controller.isChecked(value!);
                  },
                  image: 'assets/images/visa.png',
                ),

                K.sizedBoxH,
                Center(
                  child: AddButton(
                      text: 'Continue to Checkout',
                      onPressed: () {
                        Get.to(CheckOutScreen());
                      },
                  ),
                ),
                K.sizedBoxH,
                Center(
                    child: GestureDetector(
                  child:Text(
                    'Go back to review the Cart',
                    style: TextStyle(
                        color: K.grayColor, decoration: TextDecoration.underline,),
                  ),
                  onTap: () {
                    Get.to(CartScreen());
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
