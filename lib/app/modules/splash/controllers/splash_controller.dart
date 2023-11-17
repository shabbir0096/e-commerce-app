
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 5));
    final userId = box.read('userId');
    if (userId != null && userId !="") {
      Get.offNamed(Routes.PRODUCTS);
    } else {
      // Redirect to the login screen
      Get.offNamed(Routes.LOGIN);
    }
    super.onInit();
  }

}
