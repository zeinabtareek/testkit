import 'package:newapexproject/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:newapexproject/screens/cart_screen/cart_screen.dart';
import 'package:newapexproject/screens/home_screen/home_screen.dart';
import 'package:newapexproject/screens/profile_screen/profile_screen.dart';
import 'package:newapexproject/screens/setting_screen/setting_screen.dart';

import 'controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      HomeScreen(),
      CartScreen(),
      SettingScreen(),
      ProfileScreen(),
    ];
    final _controller = Get.put(HomeController());
    return Scaffold(
        body: Obx(() => Center(
              child: body.elementAt(_controller.selectIndex),
            )),
        bottomNavigationBar: Obx(() => ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      MdiIcons.storeSettings,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      MdiIcons.cartOutline,
                    ),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      MdiIcons.databaseSettings,
                    ),
                    label: 'Setting',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      MdiIcons.accountOutline,
                    ),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: K.mainColor,
                unselectedItemColor: K.grayColor,
                backgroundColor: K.whiteColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: _controller.selectIndex,
                onTap: (index) {
                  _controller.select(index);
                },
              ),
            )));
  }
}
