import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/avatar_image.dart';
import 'package:newapexproject/component/fixed_list_tile.dart';
import 'package:newapexproject/component/load_image.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/utilis/alert.dart';
import '../../constant.dart';
import '../checkout_screens/pyment_screen.dart';
import '../order_screens/address_screen.dart';
import '../order_screens/order_history.dart';
import 'controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileController());
    return Scaffold(
      appBar: const CustomAppBar(
        label: "Profile",
        actions: [],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Obx(() => LargeAvatarWithButton(
                    key: key,
                    onPressed: () {
                      _controller.chooseProfileImage();
                    },
                    image: AuthController.to.currentUser.image != null
                        ? LoadImage(
                            image: AuthController.to.currentUser.image,
                          )
                        : (_controller.imgPath != ''
                            ? Image.file(
                                File(_controller.imgPath),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            : SvgPicture.asset("assets/images/avatar.svg",
                                semanticsLabel: 'Acme Logo')))),
              ),
              Text(
                AuthController.to.currentUser.name!,
                softWrap: true,
                style: TextStyle(
                    color: K.blackColor,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 16.sp),
              ),
              Text(
                AuthController.to.currentUser.email!,
                softWrap: true,
                style: TextStyle(
                    color: K.grayColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp),
              ),
              ListView.builder(
                  itemCount: _controller.labels.length,
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => FixedListTile(
                        onTap: () {
                          if (index == 0) {
                            Get.to(OrderHistory());
                          } else if (index == 1) {
                            Get.to(PaymentScreen());
                          } else if (index == 2) {
                            Get.to(AddressScreen());
                          } else if (index == 3) {
                          } else if (index == 4) {
                            Utility.ConfirmPasswordAlert(
                                "Change password", context, () {
                              if (_controller.password ==
                                  _controller.confirmPassword) {
                                _controller.UpdatePassword();
                                Navigator.pop(context);
                              } else {
                                print(false);
                              }
                            }, (v) {
                              _controller.password.value = v;
                            }, (v) {
                              _controller.confirmPassword.value = v;
                            });
                          } else if (index == 5) {}
                        },
                        title: _controller.labels[index],
                        subTitle: _controller.subTitle[index],
                        iconLeading: _controller.icons[index],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
