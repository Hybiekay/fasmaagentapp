import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contants/constants.dart';

class Formfied extends StatefulWidget {
  const Formfied(
      {Key? key,
      this.keyboardType = TextInputType.name,
      required this.hintText,
      required this.controller,
      this.onChanged,
      this.isPassword = false,
      this.isReferral = false,
      this.onTap,
      this.validator,
      this.suffixIcon})
      : super(key: key);
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final String hintText;
  final bool isPassword;
  final bool isReferral;
  final TextEditingController controller;
  final Widget? suffixIcon;

  @override
  State<Formfied> createState() => _FormfiedState();
}

class _FormfiedState extends State<Formfied> {
  bool isObcure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          style: AppTextStyle.capton(),
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ? isObcure : false,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              fillColor: AppColor.gray,
              filled: true,
              errorStyle: GoogleFonts.dmSans(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.errorColor),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.dmSans(),
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isObcure = !isObcure;
                        });
                      },
                      child: Icon(
                          isObcure ? Icons.visibility : Icons.visibility_off))
                  : widget.isReferral
                      ? GestureDetector(
                          onTap: widget.onTap,
                          child: const Icon(Icons.camera_alt_rounded,
                              color: Colors.black),
                        )
                      : null)),
    );
  }
}
