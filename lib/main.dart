import 'package:ecommerce_store_horizon/app/modules/splash/bindings/splash_binding.dart';
import 'package:ecommerce_store_horizon/app/modules/splash/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/DI_bindings/bindings.dart';
import 'app/routes/app_pages.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ControllerBinding());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeData lightTheme = ThemeData.light();
  final ThemeData darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          navigatorKey: Get.key,
          initialBinding: Get.put(SplashBinding()),
          title: "E-Commerce App",
          debugShowCheckedModeBanner: true,
          // You can use the library anywhere in the app even in theme
          theme: lightTheme,
          darkTheme: darkTheme,
          home: WillPopScope(
              onWillPop: () async {
                // Handle back button press globally
                // Add your desired behavior here
                Get.back();
                return true;
              },
              child: const SplashView()),

        );
      },
    );
  }
}
