import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/auth_controller.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/routes/app_screen.dart';
import 'package:newapexproject/screens/favorite_screen/favorite_controller/favorite_controller.dart';
import 'package:newapexproject/screens/product_details/product_details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = Get.put(AuthController());
  final favController = Get.put(FavoriteController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    favController.getAllProductList()??'';
  }
  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return  MediaQuery(
      data: const MediaQueryData(
      ),
      child:ScreenUtilInit(
        designSize: const Size (428,926),
        builder :()=> GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home: ProductDetails(),
          initialRoute: AppRoutes.splashScreen,
          getPages: AppScreens.screens,
        ),
      ),
    );
  }
}