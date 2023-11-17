import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/product_model.dart';

class ProductsController extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        productList.addAll(jsonResponse.map((model) => Product.fromJson(model)));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print('Error fetching products: $error');
    }

}

}
