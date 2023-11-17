import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_store_horizon/app/components/custom_button.dart';
import 'package:ecommerce_store_horizon/utils/colors.dart';
import 'package:ecommerce_store_horizon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../components/slider_widget.dart';
import '../../../models/product_model.dart';
import '../../../routes/app_pages.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../cart/views/cart_view.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return true; // Return true to allow the back navigation, or false to prevent it.
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(Constants.productDetails),
          centerTitle: true,
        ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              Get.to(const CartView());
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart),
                Positioned(
                  top: -20,
                  left: 18, // Adjust the left value to position it as desired
                  child: Obx(() {
                    int cartValue = Get.find<CartController>().productQuantity.value;
                    return cartValue > 0
                        ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 13,
                      child: Text(
                        '$cartValue',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    )
                        : const SizedBox.shrink();
                  }),
                ),
              ],
            ),
          ),
        body: Column(
          children: [
            SliderWidget(controller: controller),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 150.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(controller.product.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.product.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.product.description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '\$${controller.product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 16),
                          CustomButton(
                            title: "Add to cart",
                            onPressed: () {
                              CartController cartController = Get.find();
                              cartController.incrementQuantity();
                              // Create a Product instance from the current product details
                              Product productToAdd = Product(
                                title: controller.product.title,
                                price: controller.product.price, id: controller.product.id, description: '', category: '', image: '', rating: Rating(rate: 0.0, count: 0),
                              );
                              cartController.addToCart(productToAdd);
                              // Get.snackbar("Successful", "${controller.product.title } has been added in cart" , backgroundColor: Colors.white ,snackPosition: SnackPosition.BOTTOM);
                            },
                            buttonColor: ColorsUtils.primary,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )

      ),
    );
  }
}
