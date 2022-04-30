import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String? label;

  const CustomAppBar({Key? key, this.actions, this.label = ''})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        label!,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: K.blackColor),
      ),
      centerTitle: true,
      backgroundColor: K.whiteColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: K.blackColor,
        ),
      ),
      actions: actions,
    );
  }
}
