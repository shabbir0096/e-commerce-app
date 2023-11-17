import 'package:ecommerce_store_horizon/app/modules/cart/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
class CartItemWidget extends StatelessWidget {
  final Product product;
  final CartController controller;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItemWidget({super.key,
    required this.product,
    required this.onIncrease,
    required this.onDecrease, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        title: Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
               Obx(() =>  Text(
                 '\$${(product.price * product.quantity.value).toStringAsFixed(2)}',
                 style: const TextStyle(
                   color: Colors.green,
                   fontWeight: FontWeight.bold,
                   fontSize: 14,
                 ),
               ),),

              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: onDecrease,
                ),
                Obx(() => Text(
                  '${product.quantity.value}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onIncrease,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

