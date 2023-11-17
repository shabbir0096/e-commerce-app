import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 100.r,
            backgroundColor: theme.primaryColorDark,
            child: SvgPicture.asset(
              Constants.logoSvg,
              fit: BoxFit.contain,
            ),
          ).animate().fade().slideY(
              duration: 500.ms,
              begin: 1, curve: Curves.easeInSine
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularProgressIndicator(
              color:  theme.primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
