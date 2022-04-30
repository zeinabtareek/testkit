import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key, this.color, this.label, this.onTap, this.colorText})
      : super(key: key);
  final Function()? onTap;
  final String? label;
  final Color? color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        label!.toUpperCase(),
        style: TextStyle(
          color: colorText,
          fontSize: 15.sp,
        ),
      ),
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side:  BorderSide(color: K.mainColor)),
      ),
    );
  }
}
