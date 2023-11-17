
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'custom_textview.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
              title,
              style: CustomTextView.getStyle(context, colorLight: Colors.white ,  fontSize: 16 ,fontFamily: Constants.interSemiBold)
          ),
        ),
      ),
    );
  }
}