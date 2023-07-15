import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fastaagent/contants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle heading1({
    Color color = AppColor.brandColor,
    double fontSize = 40,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle heading2({
    Color color = AppColor.brandColor,
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle body({
    Color color = AppColor.brandColor,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle capton({
    Color color = AppColor.brandColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle hintText({
    Color color = AppColor.brandColor,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static TextStyle error({
    Color color = AppColor.errorColor,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return GoogleFonts.dmSans(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }
}
