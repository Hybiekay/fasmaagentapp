import 'dart:io';
import 'package:fastaagent/controller/agent_controller.dart';
import 'package:fastaagent/global_widget/headerbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../contants/constants.dart';
import 'package:fastaagent/core/pick_image.dart';
import 'package:fastaagent/global_widget/form_field.dart';
import 'package:fastaagent/global_widget/button_component.dart';

final Uri _url = Uri.parse('https://www.fasta-smata.com/terms&condition');

class AgentFrom extends StatefulWidget {
  final String name;
  final String email;
  final String phone;

  const AgentFrom({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  State<AgentFrom> createState() => _AgentFromState();
}

class _AgentFromState extends State<AgentFrom> {
  AgentController driverController = Get.put(AgentController());
  // DriverController driverController = Get.put(DriverController());
  final confirmpasswordController = TextEditingController();
  final ninCon = TextEditingController();
  final passwordController = TextEditingController();
  bool isloading = false;
  bool isComplete = false;
  bool value = false;

  File? ninImage;
  bool driverIsUploaded = false;
  bool ninIsUploaded = false;
  bool ispassword = false;
  bool isConfirmPassword = false;
  @override
  void dispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
    ninCon.dispose();

    // DStorage.driverlogOut();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainSecondryColor,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWidget(
                        subTitle: "",
                        onPressed: () {
                          Get.back();
                        }),
                    const SizedBox(height: 50),
                    Text(
                      "Please enter the right data in the box.",
                      style: AppTextStyle.body(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Enter your NIN",
                      style: AppTextStyle.capton(fontWeight: FontWeight.bold),
                    ),
                    Formfied(
                      controller: ninCon,
                      hintText: "NIN Number",
                      keyboardType: TextInputType.number,
                    ),
                    Text("Password", style: AppTextStyle.capton()),
                    SizedBox(height: 10.h),
                    Formfied(
                        isPassword: true,
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
                    Visibility(
                        visible: ispassword,
                        child: Text(
                          'Your password must contain at lease 8 characters',
                          style: GoogleFonts.dmSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.errorColor),
                        )),
                    SizedBox(height: 10.h),
                    Text(
                      "Confirm Password",
                      style: AppTextStyle.capton(),
                    ),
                    SizedBox(height: 7.h),
                    Formfied(
                      validator: (p0) {
                        if (p0!.isEmpty || p0 != passwordController.text) {
                          setState(() {
                            isConfirmPassword = true;
                          });
                          return null;
                        }
                        return null;
                      },
                      onChanged: (p0) {
                        setState(() {
                          isConfirmPassword = false;
                          ispassword = false;
                        });
                      },
                      hintText: "Confirm Password",
                      controller: confirmpasswordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 10.h),
                    Visibility(
                        visible: isConfirmPassword,
                        child: Text(
                          'Wrong confirm password inputted',
                          style: GoogleFonts.dmSans(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.errorColor),
                        )),
                    SizedBox(height: 10.h),
                    Text("Upload your NIN Card",
                        style:
                            AppTextStyle.capton(fontWeight: FontWeight.bold)),
                    UploadBotton(
                      onPressed: () async {
                        File? nin = await pickImage();
                        if (nin != null) {
                          setState(() {
                            ninImage = nin;
                            ninIsUploaded = true;
                          });
                        }
                      },
                      uploaded: ninIsUploaded,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Checkbox(
                            value: value,
                            onChanged: (v) {
                              if (ninCon.text == '') {
                                setState(() {
                                  isComplete = false;
                                });
                                Get.snackbar("Notice", "All feild Are Required",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                setState(() {
                                  value = v!;
                                  isComplete = true;
                                });
                              }
                            }),
                        Expanded(
                          child: InkWell(
                            onTap: launchUr,
                            // Get.to(() => WebView(
                            //       url: AppApis.termsCondition,
                            //     ));
                            //  } ,
                            child: Text(
                                "Please be aware that you are not eligible to receive any dispatcher requests until you have received admin approval. If you are approved, the null-tag will become approved, and if you are rejected, it will become disapproved. Read terms and conditions to Continue",
                                style: AppTextStyle.capton()),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    isComplete
                        ? ButtonComp(
                            onPressed: () async {
                              if (passwordController.text == '' ||
                                  confirmpasswordController.text == '' ||
                                  ninCon.text == '') {
                                Get.snackbar("Notice", "All feild Are Required",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else if (passwordController.text !=
                                  confirmpasswordController.text) {
                                setState(() {
                                  isConfirmPassword = true;
                                });
                                Get.snackbar(
                                    "Notice", "Password does not match",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else if (ninImage == null) {
                                Get.snackbar("Notice", "Pick all the Image",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                setState(() {
                                  isloading = true;
                                });
                                await driverController.driverCreate(
                                  password: confirmpasswordController.text,
                                  email: widget.email,
                                  fullname: widget.name,
                                  phoneNumber: widget.phone,
                                  nin: ninCon.text,
                                  ninImage: ninImage!,
                                );
                                setState(() {
                                  isloading = false;
                                });
                              }

                              // successShowDialod(
                              //     context: context,
                              //     onPressed: () {
                              //       Get.offAll(() => DispatcherLoginScreen());
                              //     },
                              //     value:
                              //         'Your registration is now complete, and you can proceed to log in as a Dispatcher.',
                              //     bottonValue: "Login");
                            },
                            value: "Complete")
                        : const InActiveButtonComp(value: "Complete"),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> launchUr() async {
    //   if (!await launchUrl(_url)) {
    //     throw Exception('Could not launch $_url');
    //   }
  }
}

class UploadBotton extends StatelessWidget {
  final bool uploaded;
  final VoidCallback onPressed;
  const UploadBotton({
    super.key,
    this.uploaded = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: uploaded ? 78 : 48,
        width: 128,
        decoration: BoxDecoration(
            color: AppColor.gray, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            uploaded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      AppImages.failedAlertImage,
                      height: 20,
                      width: 18,
                    ),
                  )
                : Container(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                uploaded ? "Uploaded" : "Upload",
                style: AppTextStyle.capton(),
              ),
              const SizedBox(width: 15),
              Image.asset(AppImages.uploadIcon)
            ]),
          ],
        ),
      ),
    );
  }
}
