import 'package:ecommerce_store_horizon/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../components/product_item.dart';
import '../../../routes/app_pages.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Constants.dashboardTitle),
        centerTitle: true,
        leading: const SizedBox(),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: (){
                controller.removeData();
                Get.offAndToNamed(Routes.LOGIN);
              },
                child: const Icon(Icons.login)),
          )
        ],
      ),
      body: Center(
        child: Obx(() {
          return controller.isLoading.value
              ? const CircularProgressIndicator() // Show loader while loading
              : ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return ProductItem(product: controller.productList[index]);
            },
          );
        }),
      ),
    );
  }
}
