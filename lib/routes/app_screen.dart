
import 'package:get/get.dart';
import 'package:newapexproject/screens/cart_screen/cart_screen.dart';
import 'package:newapexproject/screens/checkout_screens/checkout_screen.dart';
import 'package:newapexproject/screens/checkout_screens/pyment_screen.dart';
import 'package:newapexproject/screens/home/home.dart';
import 'package:newapexproject/screens/home_screen/home_screen.dart';
import 'package:newapexproject/screens/login_screen/login_screen.dart';
import 'package:newapexproject/screens/order_screens/address_screen.dart';
import 'package:newapexproject/screens/product_details/product_details.dart';
import 'package:newapexproject/screens/profile_screen/profile_screen.dart';
import 'package:newapexproject/screens/register_screen/register_screen.dart';
import 'package:newapexproject/screens/splash_screen.dart';

import 'app_route.dart';

class AppScreens {
  static final screens = [
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.home, page: () => const Home()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen()),
    GetPage(name: AppRoutes.registerScreen, page: () => const RegisterScreen()),
    GetPage(
        name: AppRoutes.productDetailsScreen,
        page: () =>  ProductDetails()),
    // GetPage(name: AppRoutes.productScreen, page: () => const ProductsScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.cartScreen, page: () =>  CartScreen()),
    GetPage(name: AppRoutes.addressScreen, page: () =>  AddressScreen()),
    GetPage(name: AppRoutes.checksScreen, page: () => const CheckOutScreen()),
    GetPage(name: AppRoutes.paymentScreen, page: () =>  PaymentScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
  ];
}
