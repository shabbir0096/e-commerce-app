
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../modules/product_details/controllers/product_details_controller.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.controller,
  });

  final ProductDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 158,
      child: CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
          viewportFraction: 0.9,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        itemCount: controller.cards.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return Container(
            margin: const EdgeInsets.all(8.0), // Adjust the margin as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0), // Adjust the corner radius as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Adjust the shadow offset as needed
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0), // Duplicate for clipped child
              child: Image.asset(
                controller.cards[itemIndex],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}