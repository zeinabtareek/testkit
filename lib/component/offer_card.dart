import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class OfferCards extends StatelessWidget {
  const OfferCards({Key? key, this.images, this.onTap}) : super(key: key);
  final Function()? onTap;
  final String? images;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: K.width - 50.w,
        child: Image.asset(
          images!,
          fit: BoxFit.cover,
          width: K.width,
        ),
        decoration: BoxDecoration(
            color: K.mainColor, borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
