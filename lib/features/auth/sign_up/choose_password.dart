import 'package:fastaagent/contants/app_colors.dart';
import 'package:fastaagent/contants/app_styling.dart';
import 'package:fastaagent/features/auth/sign_up/d_register_screen.dart';
import 'package:fastaagent/global_widget/button_component.dart';
import 'package:fastaagent/global_widget/form_field.dart';
import 'package:fastaagent/global_widget/headerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoosePassword extends StatefulWidget {
  const ChoosePassword({super.key});

  @override
  State<ChoosePassword> createState() => _ChoosePasswordState();
}

class _ChoosePasswordState extends State<ChoosePassword> {
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool ispassword = false;
  bool isPasswordWrong = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderWidget(
                    subTitle: '',
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Please enter your chosen password",
                    style: AppTextStyle.body(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 40.h),
                  Text("Password", style: AppTextStyle.capton()),
                  SizedBox(height: 10.h),
                  Formfied(
                      validator: (p0) {
                        if (p0!.isEmpty || p0.length < 8) {
                          setState(() {
                            ispassword = true;
                          });
                          return null;
                        }
                        return null;
                      },
                      onChanged: (p0) {
                        setState(() {
                          ispassword = false;
                        });
                      },
                      hintText: "Password",
                      controller: passwordController),
                  SizedBox(height: 7.h),
                  Visibility(
                      visible: ispassword,
                      child: Text(
                        'Your password must contain at lease 8 characters',
                        style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.errorColor),
                      )),
                  SizedBox(height: 18.h),
                  Text(
                    "Confirm Password",
                    style: AppTextStyle.capton(),
                  ),
                  SizedBox(height: 10.h),
                  Formfied(
                    validator: (p0) {
                      if (p0!.isEmpty || p0 != passwordController.text) {
                        setState(() {
                          isPasswordWrong = true;
                        });
                        return null;
                      }
                      return null;
                    },
                    onChanged: (p0) {
                      setState(() {
                        isPasswordWrong = false;
                        ispassword = false;
                      });
                    },
                    hintText: "Confirm Password",
                    controller: confirmpasswordController,
                    isPassword: true,
                  ),
                  SizedBox(height: 10.h),
                  Visibility(
                      visible: isPasswordWrong,
                      child: Text(
                        'Wrong confirm password inputted',
                        style: GoogleFonts.dmSans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.errorColor),
                      )),
                  SizedBox(height: 30.h),
                  ButtonComp(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.to(() =>
                              const AddBankDetails(phoneNum: " phoneNum"));
                        }
                      },
                      value: "Complete"),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
