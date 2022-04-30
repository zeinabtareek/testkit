import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/payment_group.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/cart_container.dart';
import 'package:newapexproject/screens/order_screens/address_screen.dart';
import '../../constant.dart';
import 'cart_controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: CustomAppBar(label: "Cart", actions: [Icon(EvaIcons.shoppingCart, color: K.mainColor,), SizedBox(width: 6.w),],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w ,vertical: 8.0.h),
          child: GetBuilder<CartController>(
            init:CartController() ,
            builder:(controller)=> controller.cartProductModel.length == 0
                ? Center(
              child: Text("Empty"),
            ): Wrap(
            children: [
               ListView.builder(
                  itemCount: controller.cartProductModel.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Cart(
                                price: '',
                                label: controller.cartProductModel[index].name.toString(),
                                image:controller.cartProductModel[index].image.toString(),
                                quantity: controller.cartProductModel[index].quantity,
                                decrease: () {
                                  controller.decreaseQuentity(index);
                                },
                                increase: () {
                                  controller.increaseQuentity(index );
                                },
                                clear: () {
                                  controller.deleteProduct(controller.cartProductModel[index].name.toString());
                                },
                              );
                  }),
              K.sizedBoxH,
              GestureDetector(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric
                      (horizontal: 8.0.w ,vertical: 8.0.h),
                    child: AutoSizeText(' Clear all ' ,style: TextStyle(color :K.cardColor ,),),
                  ),
                ),
                onTap: (){
                  controller.deleteAllProduct();
                },
              ),
              K.sizedBoxH,
              K.sizedBoxH,

              PaymentGroupe(
                subTotal:  controller.totalPrice,
                shipping: 30,
                Total:  controller.totalPriceWithShipping,
                ),
              Center(
                child: AddButton(
                  text: 'Checkout',
                  onPressed: () {
                    Get.to(AddressScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }
}
