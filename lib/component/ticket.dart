import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class TicketWidget extends StatelessWidget {
  final double width;

  const TicketWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: width,
      color: K.mainColor.withOpacity(.8),
      margin: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 8.0.h),
      child: Center(
          child: AutoSizeText(
        'NEW',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
      )),
    );
  }
}
