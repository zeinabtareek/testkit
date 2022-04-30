import 'package:auto_size_text/auto_size_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/load_image.dart';
import 'package:newapexproject/model/cart_model.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:newapexproject/screens/cart_screen/cart_controller/cart_controller.dart';

import '../constant.dart';

class ProductCard extends StatelessWidget {



  final String? image;
  final int? price;
  final String? discount;
  final String? text;
  final bool? inStock;
  final int? rate;
  final Function()? onTap;
  final Function()? addToCart;

   ProductCard({
    Key? key,
    this.image,
    this.onTap,
    this.rate,
    this.inStock,
    this.text,
    this.price,
     this.addToCart,
    this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(4),
        elevation: 1,
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LoadImage(
                    image: image!,
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 30.h,
                    child: AutoSizeText(
                      text!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.w600,
                        color: K.blackColor,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBarIndicator(
                        rating: rate!.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0.sp,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        rate!.toString(),
                        style: TextStyle(
                          color: K.grayColor,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: TextStyle(
                          color: K.blackColor,
                          fontSize: 16.sp,
                        ),
                      ),
                      K.sizedBoxW,
                      Text(
                        '\$ $discount',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: K.grayColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  inStock == true
                      ? AutoSizeText(
                          'In Stock',
                          style: TextStyle(
                            height: 2.h,
                            color: Color(0xfffd0503),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      : SizedBox(),
                 Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              height: 40.h,
                              width: 120.w,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: K.blackColor),
                                onPressed: addToCart,
                                child: Row(
                                  children: [
                                    Icon(
                                      EvaIcons.shoppingCartOutline,
                                      color: K.whiteColor,
                                      size: 15.sp,
                                    ),
                                    AutoSizeText(
                                      'Add to Cart',
                                      style: TextStyle(
                                          color: K.whiteColor,
                                  fontSize: 7.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
