import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/constant.dart';

class FixedListTile extends StatelessWidget {
  const FixedListTile({
    Key? key,
    this.onTap,
    this.iconLeading,
    this.subTitle = '',
    this.title,
  }) : super(key: key);
  final String? title;
  final String? subTitle;
  final IconData? iconLeading;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Icon(
          iconLeading,
          color: K.blackColor,
          size: 30.sp,
        ),
        title: AutoSizeText(
          title!,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: AutoSizeText(
          subTitle!,
          maxLines: 1,
          style: TextStyle(
              fontSize: 12.sp, fontWeight: FontWeight.w600, height: 1.h),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20.sp,
        ));
  }
}
