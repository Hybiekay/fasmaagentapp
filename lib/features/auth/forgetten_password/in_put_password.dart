import 'package:fastaagent/controller/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contants/app_colors.dart';
import '../../../global_widget/button_component.dart';
import '../../../global_widget/form_field.dart';
import '../../../global_widget/headerbar.dart';
import '../../../global_widget/loading.dart';

class InPutEmail extends StatefulWidget {
  const InPutEmail({super.key});

  @override
  State<InPutEmail> createState() => _InPutEmailState();
}

class _InPutEmailState extends State<InPutEmail> {
  AgentController userController = Get.put(AgentController());
  final TextEditingController emailController = TextEditingController();

  bool isPasswordInC = false;
  bool isEmailCre = false;
  bool isConfirmPassword = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                          "Enter your E-mail and password to recover you password",
                          style: GoogleFonts.dmSans(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.brandColor),
                        ),
                        SizedBox(height: 40.h),
                        Text(
                          "E-mail",
                          style: GoogleFonts.dmSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.brandColor),
                        ),
                        SizedBox(height: 10.h),
                        Formfied(
                            keyboardType: TextInputType.emailAddress,
                            validator: (p0) {
                              if (p0!.isEmpty || !p0.isEmail) {
                                setState(() {
                                  isEmailCre = true;
                                });
                                return null;
                              }
                              return null;
                            },
                            onChanged: (p0) {
                              setState(() {
                                isEmailCre = false;
                              });
                            },
                            hintText: "E-mail or Username",
                            controller: emailController),
                        SizedBox(height: 7.h),
                        Visibility(
                            visible: isEmailCre,
                            child: Text(
                              'Wrong email inputted',
                              style: GoogleFonts.dmSans(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.errorColor),
                            )),
                        SizedBox(height: 15.h),
                        emailController.text.isEmpty
                            ? const InActiveButtonComp(value: "Send Otp")
                            : ButtonComp(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    await userController.forgettenPassword(
                                      emailController.text,
                                    );

                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                value: "Send Otp"),
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
