import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/payment_group.dart';
import 'package:newapexproject/screens/checkout_screens/pyment_screen.dart';
import 'package:newapexproject/screens/order_screens/address_screen.dart';
import 'package:newapexproject/screens/profile_screen/profile_screen.dart';
import '../../constant.dart';
class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:  CustomAppBar(
        label:'Checkout' ,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              K.sizedBoxH,
              Stack(
                children: [
                  SizedBox(
                    // height: 400.h,
                    width: 500.w,
                    child: Card(
                      color: K.borderColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 5.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                K.sizedBoxH,
                                AutoSizeText(
                                  'Shipping Information',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    InkWell(
                                      child: Icon(
                                        EvaIcons.personOutline,
                                        color: Colors.black.withOpacity(.7),
                                        size: 20.w,
                                      ),
                                      onTap: () {
                                        Get.to(ProfileScreen());
                                      },
                                    ),
                                    K.sizedBoxW,
                                    AutoSizeText('Cameron Williamson',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.7),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    ),
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      EvaIcons.phoneCallOutline,
                                      color: Colors.black.withOpacity(.7),
                                      size: 20.w,
                                    ),
                                    K.sizedBoxW,
                                    AutoSizeText(
                                      '(405) 555-0120 ',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(.7),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      Icons.location_pin,
                                      color: Colors.black.withOpacity(.7),
                                      size: 20.w,
                                    ),
                                    K.sizedBoxW,
                                    SizedBox(
                                      width: 300.w,
                                      // height: 300.h,
                                      child: AutoSizeText(
                                        ' 8502 Perston Rd.inglewoold Main 98380.dunken St . near to Gazoline berline station',
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(.7),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 3,
                                      ),
                                    ), K.sizedBoxH,
                                  ],
                                ),
                              ],
                            ),
                          ),K.sizedBoxH,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // left: Get.width*.74,
                    left: width * 0.74,
                    top: -8.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                      backgroundColor: K.mainColor,
                      shape: CircleBorder()),
                      onPressed: () {
                        Get.to(ProfileScreen());
                      },
                      child: Icon(
                        EvaIcons.edit2Outline,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              K.sizedBoxH,
              Stack(
                children: [
                  SizedBox(
                    height: 180.h,
                    width: 500.w,
                    child: Card(
                      color: K.mainColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 2,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 5.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                K.sizedBoxH,
                                Text(
                                  'Payment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: K.whiteColor,
                                      fontSize: 18.sp),
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Icon(
                                      EvaIcons.printer,
                                      color: K.whiteColor,
                                      size: 25.w,
                                    ),
                                    K.sizedBoxW,
                                    Text(
                                      '561056729001767',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                                Wrap(
                                  children: [
                                    Text(
                                      '12 /26',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    K.sizedBoxW,
                                    Text(
                                      '395',
                                      style: TextStyle(
                                        color: K.whiteColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                K.sizedBoxH,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: width * 0.74.w,
                    top: -6.h,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: K.borderColor,
                        shape: const CircleBorder(),
                      ),
                      onPressed: () {
                        Get.to(PaymentScreen());
                      },
                      child: Icon(
                        EvaIcons.edit2Outline,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
              K.sizedBoxH,
              PaymentGroupe(),

              AddButton(
                text: 'Place Order',
                onPressed: () {
                  Get.to(AddressScreen(address:'',));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
