
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final String labelText, hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool autofocus;
  final bool? isPassword, readOnlyField;
  final bool obscureText;
  final IconButton? icon;
  final Color cursorColor;
  final IconButton? suffixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final GestureDetector? gestureDetector;
  final String? Function(String?)? onChangedData;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final FocusNode? focusNode;
  final String? Function(String?)? onFieldSubmitted;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      this.obscureText = false,
      this.autofocus = false,
        this.onChangedData,
      this.icon,
      this.focusNode,
      this.suffixIcon,
      this.onFieldSubmitted,
      required this.cursorColor,
      this.gestureDetector,
      this.inputFormatter,
      this.isPassword = false,
      this.readOnlyField = false,
        this.validator,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        autofocus: false,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatter,
        readOnly: readOnlyField!,
        keyboardType: keyboardType,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: cursorColor,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            labelText: labelText,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsUtils.textColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: ColorsUtils.borderStrokeColor),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 1,
                  color: ColorsUtils.errorColor,
                )),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 1,
                color: ColorsUtils.errorColor,
              ),
            ),
            alignLabelWithHint: true,
            errorStyle: const TextStyle(color: ColorsUtils.errorColor),
            border: InputBorder.none,
            // prefixIcon: icon,

            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: Constants.interRegular,
              fontSize: 12.sp,
              color: ColorsUtils.hintTextColor,
            ),
            labelStyle: TextStyle(
                color: Colors.black,
                fontFamily: Constants.interRegular,
                fontSize: 12.sp)),
        validator: validator,
        onSaved: onSaved,
        onChanged: onChangedData,
      ),
    );
  }
}
