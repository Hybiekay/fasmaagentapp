import 'dart:convert';
import 'dart:developer';

import 'package:fastaagent/controller/agent_controller.dart';
import 'package:fastaagent/features/auth/forgetten_password/in_put_password.dart';
import 'package:fastaagent/global_widget/button_component.dart';
import 'package:fastaagent/global_widget/form_field.dart';
import 'package:fastaagent/global_widget/headerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../apis/models/user_model.dart';
import '../../../contants/constants.dart';
import '../../../controller/secure_storage.dart';
import '../../../global_widget/loading.dart';
import '../../bottom_nav/home.dart';
import '../sign_up/d_register_screen.dart';
import '../sign_up/verification_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AgentController driverController = Get.put(AgentController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEmailWrong = false;
  bool isPasswordWrong = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
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
                      Text("Enter your E-mail and password to login",
                          style: AppTextStyle.body()),
                      SizedBox(height: 40.h),
                      Text(
                        "E-mail",
                        style: AppTextStyle.capton(),
                      ),
                      SizedBox(height: 10.h),
                      Formfied(
                          onChanged: (p0) {
                            setState(() {
                              isEmailWrong = false;
                            });
                          },
                          hintText: "E-mail or Username",
                          controller: emailController),
                      SizedBox(height: 7.h),
                      Visibility(
                          visible: isEmailWrong,
                          child: Text(
                            'Wrong email inputted',
                            style: GoogleFonts.dmSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.errorColor),
                          )),
                      SizedBox(height: 15.h),
                      Text(
                        "Password",
                        style: AppTextStyle.capton(),
                      ),
                      SizedBox(height: 10.h),
                      Formfied(
                        onChanged: (p0) {
                          setState(() {
                            isPasswordWrong = false;
                          });
                        },
                        hintText: "Password",
                        controller: passwordController,
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
                      emailController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              !emailController.text.isEmail
                          ? const InActiveButtonComp(value: "Complete")
                          : ButtonComp(
                              onPressed: () async {
                                if (emailController.text.isEmpty ||
                                    !emailController.text.isEmail) {
                                  setState(() {
                                    isEmailWrong = true;
                                  });
                                } else if (passwordController.text.isEmpty ||
                                    passwordController.text.length < 6) {
                                  setState(() {
                                    isPasswordWrong = true;
                                  });
                                } else {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var data = await driverController.loginUser(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  setState(() {
                                    isLoading = false;
                                  });
                                  if (data.statusCode == 400) {
                                    log(data.body);
                                    final res = json.decode(data.body);
                                    Get.snackbar(
                                        backgroundColor:
                                            AppColor.mainSecondryColor,
                                        snackPosition: SnackPosition.BOTTOM,
                                        "Error",
                                        res["message"]);
                                    if (res["message"] ==
                                        "Please verify your account") {
                                      Get.to(() => VerificationScreen(
                                            phoneNumber: res["phone"],
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ));
                                    }
                                  } else if (data.statusCode == 201) {
                                    // log(data.body);
                                    final res = json.decode(data.body);

                                    UserModel driverResponse =
                                        UserModel.fromJson(res);
                                    AStorage.saveDriverToken(
                                        driverResponse.token);

                                    if (driverResponse
                                                .data.user.accountNumber ==
                                            null ||
                                        driverResponse.data.user.accountName ==
                                            null ||
                                        driverResponse.data.user.bankName ==
                                            null) {
                                      AStorage.saveDriverToken(
                                          driverResponse.token);

                                      Get.to(() => AddBankDetails(
                                            phoneNum: driverResponse
                                                    .data.user.phone ??
                                                '',
                                          ));
                                    } else if (driverResponse
                                                .data.user.accountNumber !=
                                            null &&
                                        driverResponse.data.user.accountName !=
                                            null &&
                                        driverResponse.data.user.bankName !=
                                            null) {
                                      AStorage.saveDriverToken(
                                          driverResponse.token);

                                      await AStorage.saveDriverData(data.body);
                                      Get.offAll(() => const HomePage());
                                    } else {
                                      Get.snackbar(
                                          backgroundColor:
                                              AppColor.mainSecondryColor,
                                          snackPosition: SnackPosition.BOTTOM,
                                          "Error",
                                          "Some Error Occured");
                                    }
                                  }
                                }
                              },
                              value: "Complete"),
                      SizedBox(height: 40.h),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const InPutEmail());
                          },
                          child: Text(
                            "Forget Password?",
                            style: GoogleFonts.dmSans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.brandColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
