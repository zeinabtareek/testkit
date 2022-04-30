import 'package:get/get.dart';
import 'package:newapexproject/constant.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapexproject/routes/app_route.dart';

import '../constant.dart';

class AppBarHomeScreen extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeScreen({Key? key, this.address}) : super(key: key);
  final String? address;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: K.whiteColor,
      elevation: 0,
      title: Row(
        children: [
          Icon(
            MdiIcons.mapMarkerOutline,
            color: K.mainColor,
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "Delivery address",
                style: TextStyle(color: K.grayColor, fontSize: 5.sp),
              ),
              AutoSizeText(
                address!,
                style: TextStyle(color: K.blackColor, fontSize: 5.sp),
              ),
            ],
          ),
        ],
      ),
      actions: [
        InkWell(
          child: Icon(
            MdiIcons.cartOutline,
            color: K.blackColor,
          ),
    onTap: () {
    Get.toNamed(AppRoutes.cartScreen);
    }),

        SizedBox(
          width: 5.w,
        ),
        Icon(
          Icons.notifications_none_rounded,
          color: K.blackColor,
        ),
        SizedBox(
          width: 2.w,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
