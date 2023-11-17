
import 'package:flutter/material.dart';


class ColorsUtils{
static const primary =  Color(0xFF0b813f);
static const secondary = Color(0xFF18ad8f);
static const textColor = Color(0xFF344871);
static const errorColor =Colors.red;
static const hintTextColor = Color(0xFFA19F9F);
static const borderStrokeColor = Color(0xFFBBBBBB);
static const socialBtnColor = Color(0xFFEFF5F5);
static const socialTxtColor = Color(0xFFA19F9F);
static const profileThemColor = Color(0xFFFFA741);
static const profileBgColor = Color(0xFFB6FFD9);
static const dashboardInnerScreenBgColor = Color(0xFFE4F6FF);
static const menuScreenColor = Color(0xFF17203A);


static const darkBlue = Color(0xFF173E83);
static const homeBgColor = Color(0xFFE4F6FF);


// gradient colors

  static const LinearGradient screenBgGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.topCenter,
    colors: [Color(0xFF0b813f), Colors.white],
  );
  static const RadialGradient appbarGradient = RadialGradient(
    colors: [Color(0xFFE4F6FF), Color(0xFF0B813F)],
    center: Alignment.center,
    radius: 3.0,
  );
}