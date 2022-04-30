import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/component/appbar.dart';

import '../../constant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(label: "Favorites",
        actions: [
          SizedBox(width: 6.w),]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                   Text(' 13 item ',style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w700, ),),
              ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      shape:
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: K.whiteColor,
                      child: SizedBox(
                        height: 140.h,
                        width: K.width,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(2),
                                  topRight: Radius.circular(2)),
                              clipBehavior: Clip.antiAlias,
                              child: Image.network('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                                fit: BoxFit.contain,
                                width: 140.w,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric
                                  (horizontal: 10.0.w ,vertical: 10.0.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width:200.w,
                                          child: Text('Small BagSmall BagSmall Bag',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:  TextStyle(
                                                fontSize: 16.sp,
                                                color: K.blackColor,
                                                fontFamily: "Poppins-SemiBold"),
                                          ),
                                        ),
                                        Icon(
                                          EvaIcons.shoppingCartOutline,
                                          color: K.grayColor,
                                          size: 25.sp,
                                        ),
                                      ],
                                    ),
                                    Wrap(
                                         children:[ RatingBarIndicator(
                                          rating: 2.75,
                                          itemBuilder: (context, index) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 15.0.sp,
                                          direction: Axis.horizontal,
                                        ),

                                      ],
                                    ),K.sizedBoxH,
                                    Text('255\$',
                                      style:  TextStyle(
                                          fontSize: 16.sp,
                                          color: K.mainColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
