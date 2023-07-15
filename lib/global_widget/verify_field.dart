import '../contants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyField extends StatefulWidget {
  final TextEditingController controller;
  const VerifyField({super.key, required this.controller});

  @override
  State<VerifyField> createState() => _VerifyFieldState();
}

class _VerifyFieldState extends State<VerifyField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 55,
        decoration: BoxDecoration(
            color: AppColor.gray, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          
          style: AppTextStyle.hintText(),
          controller: widget.controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            } else {
              if (value.isEmpty) {
                FocusScope.of(context).previousFocus();
              }
            }
          },
          decoration: InputDecoration(
            hintText: '0',
            hintStyle: AppTextStyle.hintText(),
            border: InputBorder.none,

          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ));
  }
}
