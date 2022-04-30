import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandSlider extends StatelessWidget {
  final String ?text;
  final String ?image;
  const BrandSlider({
    Key? key, this.text,this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 200,
          margin: EdgeInsets.symmetric(
              horizontal: 8.0.w, vertical: 8.0.h),
          width: 150.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network( image!,
              // height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: 8.0.w, vertical: 8.0.h),
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text( text!,

                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}
