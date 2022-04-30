import 'package:newapexproject/component/circle_progress_indicator.dart';
import 'package:newapexproject/component/clip_path.dart';
import 'package:newapexproject/component/register_button.dart';
import 'package:newapexproject/component/text_field.dart';
import 'package:newapexproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/rich_text.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/screens/login_screen/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(LoginController());
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height * 0.6.h,
                child: CustomPaint(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120.w,
                        height: 90.h,
                        child: Image.asset("assets/images/logo.png"),
                      ),
                      Text(
                        "Apex",
                        style: TextStyle(
                          color: K.blackColor,
                          fontSize: 22.sp,
                          fontFamily: "Poppins-Bold",
                        ),
                      )
                    ],
                  ),
                  painter: Shapes(),
                ),
              ),
              FixedTextField(
                key: key,
                label: "Email Address",
                function: (v) {
                  _controller.validEmail(v);
                  print(_controller.email);
                },
              ),
              FixedTextField(
                key: key,
                label: "Password",
                function: (v) {
                  _controller.validPassword(v);
                  print(_controller.password);
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: K.blackColor,
                      fontFamily: "Poppins SemiBold",
                    ),
                  ),
                ),
              ),
              K.sizedBoxH,
              K.sizedBoxH,
              RegisterButton(
                key: key,
                function: () {
                  _controller.log(context);

                },
                label: "Login",
              ),
              K.sizedBoxH,
              K.sizedBoxH,
              FixedRichText(
                key: key,
                leftLabel: "Don't have an account?",
                rightLabel: "Register",
                onTab: () {
                  Get.toNamed(AppRoutes.registerScreen);
                },
              ),
            ],
          ),
        ),
        Obx(() => _controller.check.value == true ? Indicator() : Container()),
      ],
    ));
  }
}
