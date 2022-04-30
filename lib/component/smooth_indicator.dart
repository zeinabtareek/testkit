import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmoothIndicator extends StatelessWidget {
  const SmoothIndicator({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 13.0.w,
        height: 13.0.h,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color));
  }
}
