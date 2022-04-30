import 'package:newapexproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({Key? key, this.onchange}) : super(key: key);
  final Function(String)? onchange;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        width: 400.w,
        child: TextField(
          onChanged: onchange,
          cursorColor: K.mainColor,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2.w),
            suffixIcon: Icon(
              Icons.search,
              color: K.mainColor,
            ),
            hintText: "     Search product",
            hintStyle: TextStyle(color: K.grayColor),
            fillColor: K.grayColor.withOpacity(.15),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
