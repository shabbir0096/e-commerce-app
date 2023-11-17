import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../models/product_model.dart';

class ProductDetailsController extends GetxController {
  //TODO: Implement ProductDetailsController
  final Product product = Get.arguments as Product;
  var cards = [Constants.card1, Constants.card2, Constants.card3];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
