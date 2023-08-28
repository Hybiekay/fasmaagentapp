import 'package:fastaagent/controller/agent_controller.dart';
import 'package:fastaagent/global_widget/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contants/constants.dart';
import '../../../global_widget/form_field.dart';
import '../../../global_widget/headerbar.dart';

class ChangePassword extends StatefulWidget {
  final String email;
  const ChangePassword({super.key, required this.email});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  AgentController userController = Get.put(AgentController());
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailWrong = false;
  bool isPasswordWrong = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SingleChildScrollView(
        child: Center(
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
                  "Please enter your new password",
                  style: GoogleFonts.dmSans(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.brandColor),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Password",
                  style: GoogleFonts.dmSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.brandColor),
                ),
                SizedBox(height: 10.h),
                Formfied(
                    onChanged: (p0) {
                      setState(() {
                        isEmailWrong = false;
                      });
                    },
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController),
                SizedBox(height: 7.h),
                Visibility(
                    visible: isEmailWrong,
                    child: Text(
                      'Wrong Password inputted',
                      style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.errorColor),
                    )),
                SizedBox(height: 18.h),
                Text(
                  "Confirm Password",
                  style: GoogleFonts.dmSans(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.brandColor),
                ),
                SizedBox(height: 10.h),
                Formfied(
                  onChanged: (p0) {
                    setState(() {
                      isPasswordWrong = false;
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
                      'Wrong password inputted',
                      style: GoogleFonts.dmSans(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.errorColor),
                    )),
                SizedBox(height: 30.h),
                ButtonComp(
                    onPressed: () async {
                      if (passwordController.text.isEmpty ||
                          passwordController.text.length < 8) {
                        setState(() {
                          isEmailWrong = true;
                        });
                      } else if (confirmpasswordController.text.isEmpty ||
                          confirmpasswordController.text.length < 8) {
                        setState(() {
                          isPasswordWrong = true;
                        });
                      } else if (passwordController.text !=
                          confirmpasswordController.text) {
                        setState(() {
                          isPasswordWrong = true;
                        });
                        Get.snackbar(
                          "Error",
                          "Password does not match",
                        );
                      } else {
                        setState(() {
                          isLoading = true;
                        });
                        await userController.resetPassword(
                            widget.email, passwordController.text);
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
                    value: "Complete"),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
