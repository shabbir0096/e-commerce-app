import 'package:get/get.dart';

import '../../../models/product_model.dart';

class CartController extends GetxController {
  RxList<Product> cartList = <Product>[].obs;
  var cartValue = 11.obs;
  RxInt productQuantity = 0.obs; // Default quantity is 1
  var totalPrice = 0.0.obs;

  void incrementQuantity() {
    productQuantity++;
  }
  // Increase quantity of a product in the cart
  void increaseQuantity(Product product) {
    product.quantity.value++;
    calculateTotalPrice();
  }

  // Decrease quantity of a product in the cart
  void decreaseQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity.value--;
    } else {
      // If the quantity is 1, remove the product from the cart
      removeFromCart(product);
      productQuantity--;
    }
    calculateTotalPrice();
  }
  void removeFromCart(Product product) {
    cartList.remove(product);
    productQuantity--;
    calculateTotalPrice();
  }

  void addToCart(Product product) {
    // Check if the product is already in the cart
    var existingProduct = cartList.firstWhereOrNull((element) => element.id == product.id);

    if (existingProduct != null) {
      // If the product is already in the cart, increase its quantity
      existingProduct.quantity.value++;
    } else {
      // If the product is not in the cart, add it with quantity 1
      cartList.add(product);
    }

    // Update the total price
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    // Calculate the total price by summing the prices of all products in the cart
    totalPrice.value = cartList.fold(0.0, (sum, product) {
      return sum + (product.price *  product.quantity.value);
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
