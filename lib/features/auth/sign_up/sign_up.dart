import 'package:fastaagent/global_widget/button_component.dart';
import 'package:fastaagent/global_widget/form_field.dart';
import 'package:fastaagent/global_widget/headerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../contants/constants.dart';
import '../../../global_widget/loading.dart';
import 'agent_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late FlCountryCodePicker countryPicker;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String? formattedPhoneNumber;
  String? phoneNumber;
  CountryCode? countryCode;
  bool inCorrect = false;
  bool isfullname = false;

  bool isemailController = false;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // Storage.CustomerlogOut();
    final favoriteCountries = ['NG', "US", 'CA'];
    countryPicker = FlCountryCodePicker(
      favorites: favoriteCountries,
      favoritesIcon: const Icon(
        Icons.favorite,
        color: AppColor.mainColor,
      ),
    );

    super.initState();
  }

  pickCountry(BuildContext context) async {
    final code = await countryPicker.showPicker(context: context);
    setState(() {
      countryCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? const Loader()
          : SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: AppColor.mainColor,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HeaderWidget(subTitle: '', onPressed: () {}),
                            SizedBox(height: 30.h),
                            Text("Please enter correct information in the box",
                                style: AppTextStyle.body(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 20.h),
                            Text(
                              "Enter your full name",
                              style: AppTextStyle.capton(
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Formfied(
                                validator: (p0) {
                                  if (p0!.isEmpty) {
                                    setState(() {
                                      isfullname = true;
                                    });
                                    return null;
                                  }
                                  return null;
                                },
                                onChanged: (p0) {
                                  setState(() {
                                    isfullname = false;
                                    isemailController = false;
                                    inCorrect = false;
                                  });
                                },
                                hintText: "Full Name",
                                controller: fullNameController),
                            Visibility(
                                visible: isfullname,
                                child: Text(
                                  'Full Name must not be empty',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.errorColor),
                                )),
                            SizedBox(height: 10.h),
                            Text("E-mail",
                                style: AppTextStyle.capton(
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Formfied(
                              keyboardType: TextInputType.emailAddress,
                              validator: (p0) {
                                if (p0!.isEmpty || !p0.isEmail) {
                                  setState(() {
                                    isemailController = true;
                                  });
                                  return null;
                                }
                                return null;
                              },
                              onChanged: (p0) {
                                setState(() {
                                  isfullname = false;
                                  isemailController = false;
                                  inCorrect = false;
                                });
                              },
                              hintText: "E-mail",
                              controller: emailController,
                            ),
                            Visibility(
                                visible: isemailController,
                                child: Text(
                                  'Wrong email inputted',
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.errorColor),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Enter your mobile number',
                              style: AppTextStyle.capton(
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 80,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: AppColor.gray,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: TextButton.icon(
                                            onPressed: () {
                                              pickCountry(context);
                                            },
                                            icon: const Icon(
                                                Icons.arrow_drop_down),
                                            label: countryCode != null
                                                ? countryCode!.flagImage()
                                                : const Text("")),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.height *
                                        0.303,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: AppColor.gray,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            controller: phoneController,
                                            keyboardType: TextInputType.phone,
                                            decoration: InputDecoration(
                                                hintText: 'Mobile Number',
                                                hintStyle: GoogleFonts.dmSans(),
                                                prefixIcon: SizedBox(
                                                  width: 60,
                                                  height: 45,
                                                  child: Center(
                                                    child: Text(
                                                        countryCode?.dialCode ??
                                                            '+1'),
                                                  ),
                                                ),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Visibility(
                                visible: inCorrect,
                                child: Text(
                                  "Wrong mobile number inputed",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.errorColor),
                                )),
                            SizedBox(height: 20.h),
                            ButtonComp(
                                onPressed: () {
                                  if (!_formKey.currentState!.validate() ||
                                      countryCode != null) {
                                    phoneNumber = countryCode!.dialCode +
                                        phoneController.text.trim();
                                    formattedPhoneNumber =
                                        phoneNumber!.substring(1);

                                    if (fullNameController.text.isEmpty) {
                                      setState(() {
                                        isfullname = true;
                                      });
                                    } else if (phoneController.text.isEmpty) {
                                      setState(() {
                                        inCorrect = true;
                                      });
                                    } else if (emailController.text.isEmpty ||
                                        !emailController.text.isEmail) {
                                      setState(() {
                                        isemailController = true;
                                      });
                                    } else {
                                      Get.off(
                                        () => AgentFrom(
                                          email: emailController.text,
                                          name: fullNameController.text,
                                          phone: formattedPhoneNumber!,
                                        ),
                                      );
                                    }
                                  }
                                },
                                value: 'Next'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'By continuing you may recive an SMS for \nverification. Message and data rates may apply.',
                                style: TextStyle(
                                  color: AppColor.whiteColor,
                                  fontFamily: 'DMSans',
                                  fontSize: 15.sp,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1.1,
                                ),
                              ),
                            ),
                          ]),
                    )),
              ),
            ),
    );
  }
}
