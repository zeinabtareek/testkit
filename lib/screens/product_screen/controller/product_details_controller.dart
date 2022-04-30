import 'package:get/get.dart';
import 'package:newapexproject/controller/base_controller.dart';
import 'package:newapexproject/model/products_model.dart';
import 'package:newapexproject/services/products_services.dart';

class ProductScreenController extends BaseController {
  final _services = CategoryServices();
  final docs = <ProductModel>[].obs;

  final List<String> labels = ['see all', 'Bags', 'Women fashion', 'shoes'];
  final List<String> productsText = [
    'Classic Hoodie',
    'Jordan 5 Retro',
    'Buffalo Aspha Rld',
    'Fila Bijou -Women Dresses',
    'adidas Originals Relaxed Risque Lightweight',
    'Nike Bags -Unisex Bags',
    'Jordan Flightclub \'91',
    'Nike Newborn Coverall ',
    'adidas Originals',
    ' Jordan Sky - Baby Shoes',
    'adidas Backpack',
    'Nike Futura 365 Mini Backpack',
  ];
  final selectedIndex = 0.obs;
  final check = false.obs;

  selected(int index) {
    selectedIndex.value = index;
  }

  checkFun() {
    check.value = !check.value;
  }

  getDocs(String id, String key) async {
    docs.assignAll(await _services.getCategoryDocs(id, key));
  }




  getallDocs(String id) async {
    docs.assignAll(await _services.seeAll(id));
  }

}
