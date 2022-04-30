import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/address_text_field.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/routes/app_route.dart';

import '../../constant.dart';
import '../checkout_screens/map/map_screen.dart';
import 'map/screen/my_location_screen.dart';

class AddressScreen extends StatelessWidget {
  String ? address;
   AddressScreen({Key? key, this.address }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: "Order",
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 3.0.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                K.sizedBoxH,
                AutoSizeText(
                  'Full Name',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                AddressTextField(
                  label: 'Full Name',
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'Email name *Optional',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                AddressTextField(
                  label: 'Email name *Optional',
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'Address',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                Stack(
                  children: [
                    AddressTextField(
                      addresslabel:address.toString()!=null?address.toString():'Address',
                      label: address.toString()!=null?address.toString():'Address',

                    ),
                    Positioned(
                      right: 2.w,
                      top: 0.h,
                      bottom: 0.h,
                      child: IconButton(onPressed: (){
                        Get.to(MapScreen());

                      }, icon: Icon(Icons.location_on_outlined,color: K.mainColor,))),

                  ],
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'City',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                AddressTextField(
                  label: 'City',
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'Phone 1',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                AddressTextField(
                  label: 'Phone 1',
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'Phone 2',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                AddressTextField(
                  label: 'Phone 2',
                ),
                K.sizedBoxH,
                AutoSizeText(
                  'Additional Notes *Optional',
                  style: TextStyle(
                      color: Color(0xFF2D2D2D),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600),
                ),
                K.sizedBoxH,
                AddressTextField(
                  label: 'Write any other information( Optional)',
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                Center(
                  child: AddButton(
                      text: 'Continue to Payment',
                      onPressed: () {
                        Get.toNamed(AppRoutes.paymentScreen);
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
