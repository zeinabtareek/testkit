import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/constant.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapexproject/screens/order_screens/order_details.dart';
import 'package:newapexproject/screens/order_screens/order_history.dart';

import '../../constant.dart';

class ConfirmationBill extends StatelessWidget {
  const ConfirmationBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
         actions: [
          IconButton(onPressed: () {}, icon: IconButton(icon: const Icon(EvaIcons.homeOutline, color: Colors.black, ), onPressed: () {}),),
           SizedBox(width: 6.w),
          ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric
            (horizontal: 8.0.w ,vertical: 8.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: MediaQuery.of(context).size.height*.1,
                width: double.infinity,
                color: K.grayColor.withOpacity(.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'It\'s Ordered',
                      style: TextStyle(color: K.blackColor,fontSize: 18.sp,),
                      ),

                     Text(
                      'Order No. #15997',
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: K.blackColor),
                    ),
                  ],
                ),
              ),
              K.sizedBoxH,
              Center(child: Text('You\'ve successfully placed the order',style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18.sp), )),
              K.sizedBoxH,
              SizedBox(width: MediaQuery.of(context).size.width,
                  child:  Text('You can check statue of your order by using our delivery status feature you will receive an order confirmation call with details of your order . Track you order now',style: TextStyle(height: 2.5.h,letterSpacing: .5.w ,color: K.blackColor.withOpacity(.7)),)),
              K.sizedBoxH,
              Center(
                child: AddButton(text: 'Track your Order', onPressed: () {Get.to(OrderDetails());},),),
              K.sizedBoxH,
              Text('Your account',style: TextStyle(fontWeight: FontWeight.w600 ,fontSize: 18.sp), ),
              K.sizedBoxH,
              SizedBox(width: MediaQuery.of(context).size.width,
                  child:  Text('You can log to your account using email and password defined earlier . On your account you can edit your profile data , check your history of transactions .edit subscription to newsletters',style: TextStyle(height: 2.5.h,letterSpacing: .5.w ,color: K.blackColor.withOpacity(.7)),)),
              K.sizedBoxH,
              Center(child:GestureDetector(child: const Text('View your Orders History >>' ,style: TextStyle(color: K.blackColor,decoration: TextDecoration.underline),),onTap: (){Get.to(OrderHistory());},))

            ],
          ),
        ),
      ),
    );
  }
}
