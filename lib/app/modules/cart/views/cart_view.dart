import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/cart_item_widget.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  controller: controller,
                  product: controller.cartList[index],
                  onIncrease: () {
                    controller.increaseQuantity(controller.cartList[index]);
                  },
                  onDecrease: () {
                    controller.decreaseQuantity(controller.cartList[index]);
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
               Obx(() =>  Text(
                 'Total Price: \$${controller.totalPrice.value.toStringAsFixed(2)}',
                 style: const TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                 ),
               ),)
                // Add any other information you want to display
              ],
            ),
          ),
        ],
      ),
    );
  }
}
