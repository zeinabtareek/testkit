import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class PaymentListTile extends StatelessWidget {
  String ? image;
  String ? label;
  int  value;
  int groupValue;
  void Function(int? value ) onChanged;
  PaymentListTile({
    Key? key,
    required this.label,
    required this.image,
    required this.value,
    required this.groupValue,
      required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      title: Wrap(
        children: [
          Image.asset(
            image!,fit: BoxFit.contain,
            height: 60.h,
            color: Color(0xFF0D47A1),
            width: 100.sp,
          ),
          AutoSizeText(
            label!,
            style: TextStyle(
                color: K.blackColor.withOpacity(.8),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
      leading: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        // onChanged: (value) {},

      ),
    );
  }
}
