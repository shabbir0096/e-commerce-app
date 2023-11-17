import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';
import '../routes/app_pages.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            product.image,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '${product.price.toStringAsFixed(2)} \$',
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        onTap: () {
          Get.toNamed(Routes.PRODUCT_DETAILS , arguments: product,);
        },

      ),
    );

  }
}