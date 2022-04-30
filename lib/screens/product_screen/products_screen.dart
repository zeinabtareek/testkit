import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/buttons_product_screen.dart';
import 'package:newapexproject/component/card_product.dart';
import 'package:newapexproject/component/circle_progress_indicator.dart';
import 'package:newapexproject/constant.dart';
import 'package:newapexproject/model/cart_model.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/screens/cart_screen/cart_controller/cart_controller.dart';
import 'package:newapexproject/screens/home_screen/controller/home_controller.dart';
import 'package:newapexproject/screens/product_details/product_details.dart';
import 'package:newapexproject/screens/product_screen/controller/product_details_controller.dart';

class ProductScreen extends StatelessWidget {
   ProductScreen({
    Key? key,
    this.id,
  }) : super(key: key);
   final cartController = Get.put(CartController());

   final String? id;
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProductScreenController());

    return Scaffold(
      appBar: CustomAppBar(
        label: 'Products',
        actions: [
          IconButton(
              icon: Icon(
                EvaIcons.shoppingCartOutline,
                color: K.grayColor,
                size: 25.sp,
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.cartScreen);
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 60.h,
                child: Center(
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: HomeScreenController.to.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) => Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.0.w,
                          vertical: 8.0.h,
                        ),
                        child: Obx(
                          () => Buttons(
                            label: HomeScreenController.to.docs[index].name!,
                            color: _controller.selectedIndex.value == index
                                ? K.whiteColor
                                : K.mainColor,
                            colorText: _controller.selectedIndex.value == index
                                ? K.mainColor
                                : K.whiteColor,
                            onTap: () {
                               _controller.selected(index)!=0?
                              _controller.getDocs(id!,
                                  HomeScreenController.to.docs[index].key!):
                                   _controller.getallDocs(id!);
                              _controller.selected(index);
                              // _controller.getDocs(id!,
                              //     HomeScreenController.to.docs[index].key!);
                              // _controller.selected(index);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => _controller.docs.length == 0
                      ? Indicator()
                      : GridView.builder(
                          itemCount: _controller.docs.length,
                          shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: MediaQuery.of(context)
                                    .size
                                    .width /
                                (MediaQuery.of(context).size.height / 1.5.h),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (ctx, index) => ProductCard(
                          onTap: () {
                            Get.to(() => ProductDetails(
                                  productModel: _controller.docs[index],
                                ));
                          },
                          rate: _controller.docs[index].rate,
                          inStock: _controller.docs[index].inStock,
                          discount: _controller.docs[index].discount,
                          price: _controller.docs[index].price,
                          text: _controller.docs[index].name,
                          image: _controller.docs[index].image,
                          addToCart: () {
                            cartController.addToCart(CartProductModel(
                              name:_controller.docs[index].name,
                              image:_controller.docs[index].image,
                              price: _controller.docs[index].price,
                              productId:_controller.docs[index].key,
                              // rate: productDetailsModel.rate,
                              quantity: 1,
                            ));
                          },
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
