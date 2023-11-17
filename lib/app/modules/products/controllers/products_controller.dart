import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/api_endpoints.dart';
import '../../../models/product_model.dart';

class ProductsController extends GetxController {
  var productList = <Product>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void removeData() {
    // Initialize GetStorage
    GetStorage box = GetStorage();
    box.remove('userId');
  }

  void fetchProducts() async {
    isLoading.value = true;
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.products);
      final response = await http.get(url).timeout(const Duration(minutes: 1));
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        productList
            .addAll(jsonResponse.map((model) => Product.fromJson(model)));
      } else if (response.statusCode == 401) {
        Get.snackbar("Not Found", "Products not found" , backgroundColor: Colors.red , snackPosition: SnackPosition.BOTTOM);
      } else {
        throw Exception(
            'Failed to load products: ${response.statusCode} ${response.reasonPhrase}');
      }
    } on TimeoutException catch (timeoutError) {
      Get.snackbar("Error", timeoutError.toString() , backgroundColor: Colors.red , snackPosition: SnackPosition.BOTTOM);
    } on SocketException catch (socketError) {

      Get.snackbar("Error", socketError.toString() , backgroundColor: Colors.red , snackPosition: SnackPosition.BOTTOM);

    } catch (error) {
      Get.snackbar("Error", error.toString() , backgroundColor: Colors.red , snackPosition: SnackPosition.BOTTOM);
    }
  finally {
    isLoading.value = false;
  }
  }
}
