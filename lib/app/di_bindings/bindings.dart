import 'package:ecommerce_store_horizon/app/modules/login/controllers/login_controller.dart';
import 'package:ecommerce_store_horizon/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:ecommerce_store_horizon/app/modules/products/controllers/products_controller.dart';
import 'package:ecommerce_store_horizon/app/modules/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
          () => SplashController(),
    );
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );

    Get.lazyPut<ProductsController>(
          () => ProductsController(),
    );
    Get.lazyPut<ProductDetailsController>(
          () => ProductDetailsController(),
    );
  }

}
