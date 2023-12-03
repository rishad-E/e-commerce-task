import 'package:ecommerce_task/model/item_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<ItemModel> cartitem = [];
  int total = 0;

  addtocart(ItemModel model) {
    cartitem.add(model);
    update();
  }

  removecart(index) {
    cartitem.removeAt(index);
    update();
  }

  calculation() {
    int temp = 0;
    for (var ele in cartitem) {
      temp += ele.price;
    }
    total = temp;
    update();
  }
}
