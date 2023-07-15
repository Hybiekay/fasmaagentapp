import '../contants/constants.dart';
import 'package:flutter/material.dart';

class Formfied extends StatelessWidget {
  const Formfied(
      {Key? key,
      this.keyboardType = TextInputType.name,
      required this.hintText,
      required this.controller,
      this.suffixIcon})
      : super(key: key);

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController controller;

  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 45,
      decoration: BoxDecoration(
          color: AppColor.gray, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          style: AppTextStyle.hintText(),
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: AppTextStyle.hintText(),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
