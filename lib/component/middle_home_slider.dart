import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class MiddleHomePageSlider extends StatelessWidget {
  const MiddleHomePageSlider({
    Key? key,
    required this.borderWidth,
  }) : super(key: key);

  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:  EdgeInsets.symmetric
            (horizontal: 15.0.w ,vertical: 10.0.h),

          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderWidth),
              color: K.grayColor.withOpacity(.3),
              border: Border.all(color: Colors.black12, width: 1)),
        ),
        ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (ctx, index) => Container(
            height: 190.h,
            width: 200.0.w,
            padding: EdgeInsets.symmetric
              (horizontal: 5.0.w ,vertical: 5.0.h),
            child:
            Image.network('http://pngimg.com/uploads/running_shoes/running_shoes_PNG5827.png',
              height: MediaQuery.of(context).size.height.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

          ),
        ),
      ],
    );
  }
}
