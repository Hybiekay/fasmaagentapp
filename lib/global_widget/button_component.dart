import '../contants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable

class ButtonComp extends StatelessWidget {
  String value;
  VoidCallback onPressed;
  final Color? bgcolor;
  final Color? textColor;
  ButtonComp(
      {super.key,
      required this.onPressed,
      this.textColor,
      this.bgcolor,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: bgcolor ?? AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              color: textColor ?? AppColor.mainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class InActiveButtonComp extends StatelessWidget {
  final String value;

  const InActiveButtonComp({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              color: AppColor.mainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
