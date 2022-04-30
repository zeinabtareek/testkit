import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/circle_progress_indicator.dart';
import 'package:newapexproject/component/clip_path.dart';
import 'package:newapexproject/component/register_button.dart';
import 'package:newapexproject/component/rich_text.dart';
import 'package:newapexproject/component/text_field.dart';
import 'package:newapexproject/constant.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/screens/register_screen/controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RegisterController());
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  height: Get.height * 0.4.h,
                  child: CustomPaint(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 100.w,
                          height: 80.h,
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ],
                    ),
                    painter: Shapes(),
                  ),
                ),
                FixedTextField(
                  key: key,
                  label: "Name",
                  function: (v) {
                    _controller.validName(v);
                  },
                ),
                FixedTextField(
                  key: key,
                  label: "Email",
                  function: (v) {
                    _controller.validEmail(v);
                  },
                ),
                FixedTextField(
                  key: key,
                  label: "Phone",
                  function: (v) {
                    _controller.validPhone(v);
                  },
                ),
                FixedTextField(
                  key: key,
                  label: "Password",
                  function: (v) {
                    _controller.validPassword(v);
                  },
                ),
                box(),
                RegisterButton(
                  key: key,
                  function: () {
                    _controller.register();
                  },
                  label: "Register",
                ),
                K.sizedBoxH,
                K.sizedBoxH,
                FixedRichText(
                  key: key,
                  leftLabel: "Already have an account?",
                  rightLabel: "Log in",
                  onTab: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                ),
              ],
            ),
          ),
          Obx(() =>
              _controller.check.value == true ? Indicator() : Container()),
        ],
      ),
    );
  }

  Widget box() {
    return SizedBox(
      height: 40.h,
    );
  }
}
