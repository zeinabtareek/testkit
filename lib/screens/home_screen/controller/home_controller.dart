import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/enum/view_state.dart';
import 'package:newapexproject/model/banner_model.dart';
import 'package:newapexproject/model/category_model.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:newapexproject/services/home_services.dart';

class HomeScreenController extends BaseController {
  static final HomeScreenController to = Get.find();
  final _services = HomeServices();
  final CarouselController controller = CarouselController();
  final list = <CategoryModel>[].obs;
  final docs = <CategoryModel>[].obs;
  final currentIndex = 0.obs;
  final product = <ProductModel>[].obs;
  Future<BannerModel>? banners;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    ViewState.busy;
    banners = _services.getBanner();
    list.assignAll(await _services.getCategory());
    product.assignAll(await _services.getProduct());
    ViewState.idle;
  }

  getDocs(String id) async {
    docs.assignAll(await _services.getCategoryDocs(id));
  }

  final List<String> images = [
    "assets/images/fashion.jpeg",
    "assets/images/beauty.jpeg",
    "assets/images/furniture.jpeg",
    "assets/images/device.jpeg",
    "assets/images/wire.jpeg"
  ];

  final List<String> orders = [
    "assets/images/order.jpeg",
    "assets/images/offer.jpeg",
    "assets/images/offer2.jpeg",
  ];
}
