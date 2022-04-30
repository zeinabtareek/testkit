import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerColors extends StatelessWidget {
  const ContainerColors({Key? key, this.color}) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric
        (horizontal: 5.0.w ,vertical: 5.0.h),

      child: Container(
        height: 50.h,
        width: 25.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(.5, .5), // shadow direction: bottom right
            )
          ],
        ),
      ),
    );
  }
}
