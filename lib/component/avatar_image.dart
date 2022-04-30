import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/constant.dart';

class LargeAvatarWithButton extends StatelessWidget {
  final Widget? image;
  final Function()? onPressed;

  const LargeAvatarWithButton({Key? key, this.image, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.black12.withAlpha(25),
                    spreadRadius: .09,
                    offset: const Offset(2, 1),
                  )
                ],
              ),
              clipBehavior: Clip.antiAlias,
              width: 150,
              height: 150,
              child: image),
          Positioned(
            bottom: 0,
            right: 0,
            child: RawMaterialButton(
              child: Icon(Icons.camera_alt, color: K.blackColor,size: 30.sp),
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
