import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../constant.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(

        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(
              Icons.favorite_outline,
              color: Colors.black,
              size: 25.sp,
            ),
          ),
          K.sizedBoxW,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0,right: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                 Text(
                  'Order No. #15252',
                  style: TextStyle(fontSize: 18.sp),
                ),
                K.sizedBoxH,
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                     Text('Classic Hoodie',style: TextStyle(color: K.grayColor,fontSize: 14.sp),),
                    K.sizedBoxW,
                    K.sizedBoxW,
                     Text('x3',style: TextStyle(color: K.grayColor,fontSize: 16.sp),),
                    const Text('\$338.00',style: TextStyle(color: K.blackColor ),),
                  ],
                ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                     Text('jonie Women Shoes',style: TextStyle(color: K.grayColor,fontSize: 14.sp,height: 2.h),),
                    K.sizedBoxW,
                    K.sizedBoxW,
                    Text('x1',style:  TextStyle(color: K.grayColor,fontSize: 18.sp),),
                    Text('\122.00',style: const TextStyle(color: K.blackColor ),),
                  ],
                ), K.sizedBoxH,
                Container(
                  height: MediaQuery.of(context).size.height*.19,
                  padding: EdgeInsets.all(15),
                  color: K.grayColor.withOpacity(.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Subtotal',
                            style: TextStyle(color: K.blackColor),
                            ),

                           Text(
                            '\$360.00',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: K.blackColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text('Shipping Method',
                            style:  TextStyle(color: K.blackColor,
                              fontSize: 16.sp,
                            ),
                            ),
                           Text('\$Shipping',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: K.blackColor,
                                  height: 2)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Total',
                            style:  TextStyle(color: K.blackColor,
                                fontWeight: FontWeight.bold,
                              fontSize: 18.sp,

                            ),
                            ),
                           Text(
                            '\$400.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: K.blackColor,
                                height: 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                K.sizedBoxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('Status', style: TextStyle(color: K.blackColor,fontSize: 16.sp ,fontWeight: FontWeight.bold)),
                    Text('PROCESSING'.toUpperCase(),style: TextStyle(color: K.mainColor),)
                  ],
                ),
                K.sizedBoxH,

                const StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 2,
                  selectedColor: K.mainColor,
                  unselectedColor: K.grayColor,
                ),

                K.sizedBoxH,
                 Text('Shipping Address',style: TextStyle(color: K.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold),),
                 Text('128 trandonSt ,london ,Mit ',style: TextStyle(color: K.grayColor,
                    fontSize: 16.sp,

                    fontWeight: FontWeight.normal ,height: 2),),
                ],
          ),
        ),
      ),
    );
  }
}
