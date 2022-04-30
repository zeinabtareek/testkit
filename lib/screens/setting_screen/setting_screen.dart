import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/fixed_list_tile.dart';
import '../order_screens/address_screen.dart';
import 'controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SettingController());
    return Scaffold(
      appBar: const CustomAppBar(
        label: "Settings ",
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                itemCount: _controller.labels.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric
                  (horizontal: 2.0.w ,vertical: 2.0.h),
                itemBuilder: (ctx, index) => FixedListTile(
                  onTap: () {
                    if (index == 0) {}
                    else if (index == 1) {}
                    else if (index == 2) {
                      Get.to(AddressScreen());
                    } else if (index == 3) {}
                  },
                  title: _controller.labels[index],
                  iconLeading: _controller.icons[index],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
