import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/constant.dart';

class RowTextHomePage extends StatelessWidget {

  const RowTextHomePage({Key? key, this.Text, required this.isThereMore}) : super(key: key);
  final String? Text;
  final bool isThereMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(Text!,
            style: TextStyle(color: K.blackColor, fontSize: 18.sp,),
          ),
          AutoSizeText(isThereMore?
            "show all":'',
            style: TextStyle(color: K.mainColor, fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
