import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, this.onTap, this.image, this.label, this.price})
      : super(key: key);
  final String? label;
  final String? image;
  final String? price;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 1,
        shadowColor: K.grayColor,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: AutoSizeText(
                  label!,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: AutoSizeText(
                  price!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 6.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: K.whiteColor),
        ),
      ),
    );
  }
}
