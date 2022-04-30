import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
        this.onTap,
        this.label,
        this.price,
        this.favouriteFun,
        this.images})
      : super(key: key);
  final Function()? onTap;
  final String? label;
  final String? price;
  final Function()? favouriteFun;
  final String? images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
            color: Colors.white,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Image.network(
                    images!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250.h,
                  ),
                  // Positioned(
                  //   child: IconButton(
                  //     onPressed: favouriteFun,
                  //     icon: Icon(
                  //       iconData,
                  //       size: 25.sp,
                  //       color: K.grayColor,
                  //     ),
                  //   ),
                  //   top: 5.h,
                  //   right: 3.w,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      height: 2.h,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: K.blackColor,
                    ),
                  ),
                  Text(
                    price!,
                    style:  TextStyle(
                      color: K.grayColor,
                      fontSize: 14.sp,
                    ),
                  ),
                   Text('In Stock',
                      style: TextStyle(
                        height: 2.h,
                        color: K.cardColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0.sp,
                        direction: Axis.horizontal,
                      ),
                       Icon(
                        EvaIcons.shoppingCartOutline,
                        color: K.grayColor,
                        size: 25.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
