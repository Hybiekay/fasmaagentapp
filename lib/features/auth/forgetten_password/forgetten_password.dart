// ignore_for_file: use_build_context_synchronously

import 'package:fastaagent/controller/agent_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../contants/constants.dart';
import 'change_password.dart';

class ForgottenPassword extends StatefulWidget {
  final String phoneNumber;
  final String email;
  const ForgottenPassword(
      {super.key, required this.phoneNumber, required this.email});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  AgentController userController = Get.put(AgentController());
  final TextEditingController emailController = TextEditingController();
  bool isEmailWrong = false;
  bool isPasswordWrong = false;
  bool isLoading = false;
  late String statusCode;
  String code = '9908';
  bool isInCorrect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.only(right: 20, left: 30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                color: AppColor.mainColor,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    Text(
                      'Enter the 4-digit code sent to you at \n${widget.email} ',
                      style: TextStyle(
                        color: AppColor.brandColor,
                        fontFamily: 'DM Sans',
                        fontSize: 18.sp,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: Row(
                        children: [
                          Container(
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColor.brandColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.bold),
                                onChanged: (value) {
                                  setState(() {
                                    isInCorrect = false;
                                  });
                                  if (value.length == 1) {
                                    setState(() {
                                      code = value;
                                    });
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColor.brandColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.bold),
                                onChanged: (value) {
                                  setState(() {
                                    isInCorrect = false;
                                  });
                                  if (value.length == 1) {
                                    setState(() {
                                      String nevalue = ("$code$value");

                                      code = nevalue;
                                    });
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                onSaved: (newValue2) {
                                  setState(() {
                                    code = ('$code$newValue2');
                                  });
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColor.brandColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.bold),
                                onChanged: (value) {
                                  setState(() {
                                    isInCorrect = false;
                                  });
                                  setState(() {
                                    String nevalue = ("$code$value");

                                    code = nevalue;
                                  });
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColor.brandColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.bold),
                                onChanged: (value) async {
                                  setState(() {
                                    isInCorrect = false;
                                  });
                                  setState(() {
                                    String nevalue = ("$code$value");

                                    code = nevalue;
                                  });
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var data = await userController.verifyOtp(
                                      code: code,
                                      phoneNumber: widget.phoneNumber);

                                  setState(() {
                                    isLoading = false;
                                  });

                                  if (data.statusCode == 201) {
                                    Get.to(() => ChangePassword(
                                          email: widget.email,
                                        ));
                                  } else {
                                    setState(() {
                                      isInCorrect = true;
                                    });
                                  }
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        isInCorrect = false;
                                      });
                                    }
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: "",
                                  border: InputBorder.none,
                                ),
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: isInCorrect
                            ? const Text(
                                "Wrong 4-digit code inputed",
                                style: TextStyle(
                                    fontFamily: 'DMSans',
                                    color: AppColor.errorColor,
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.5),
                              )
                            : null),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: AppColor.brandColor),
                            onPressed: () async {
                              setState(() {
                                isInCorrect = false;
                              });
                              setState(() {
                                isLoading = true;
                              });
                              await userController.forgettenPassword(
                                widget.email,
                              );
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text(
                              'I didn’t receive a code',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.mainColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 15.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: AppColor.mainSecondryColor),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Go back!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 15.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ])),
    );
  }
}
