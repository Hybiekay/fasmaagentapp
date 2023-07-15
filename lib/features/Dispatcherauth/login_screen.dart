import 'package:get/get.dart';
import 'verification_screen.dart';
import 'package:flutter/material.dart';
import '../../contants/constants.dart';
import 'package:fastaagent/global_widget/form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

class LoginScreen extends StatefulWidget {
  // static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FlCountryCodePicker countryPicker;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // DriverController driverController = Get.put(DriverController());
  String? formattedPhoneNumber;
  String? phoneNumber;
  CountryCode? countryCode;
  bool inCorrect = false;
  bool isLoading = false;

  @override
  void initState() {
    final favoriteCountries = ['NG', "US", 'CA'];
    countryPicker = FlCountryCodePicker(
      favorites: favoriteCountries,
      favoritesIcon: const Icon(
        Icons.favorite,
        color: AppColor.mainColor,
      ),
    );
    // DStorage.driverlogOut();
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
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        Text('Enter your mobile number',
                            style: AppTextStyle.body()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextButton.icon(
                                        onPressed: () {
                                          pickCountry(context);
                                        },
                                        icon: const Icon(Icons.arrow_drop_down),
                                        label: countryCode != null
                                            ? countryCode!.flagImage()
                                            : const Text("")),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.height * 0.302,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: AppColor.gray,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: phoneController,
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                            hintText: 'Mobile Number',
                                            hintStyle: AppTextStyle.hintText(),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Formfied(
                          controller: emailController,
                          hintText: 'Email',
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: inCorrect
                                ? Text(
                                    "Wrong mobile number inputed",
                                    style: AppTextStyle.error(),
                                  )
                                : null),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.whiteColor,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.brandColor),
                            onPressed: () async {
                              if (phoneController.text.isEmpty &&
                                  emailController.text.isEmpty &&
                                  countryCode == null) {
                                Get.snackbar("Validation message",
                                    "Kindly fill all fields");
                              } else {
                                if (countryCode != null &&
                                    phoneController.text.isEmpty) {
                                  setState(() {
                                    inCorrect = true;
                                  });
                                }
                                if (countryCode != null) {
                                  setState(() {
                                    phoneNumber = countryCode!.dialCode +
                                        phoneController.text.trim();
                                    formattedPhoneNumber =
                                        phoneNumber!.substring(1);
                                  });

                                  setState(() {
                                    isLoading = true;
                                  });
                                  // driverController.loginUser(
                                  //     emailController.text,
                                  //     formattedPhoneNumber!);
                                  setState(() {
                                    isLoading = false;
                                  });

                                  Get.to(() => VerifyScreen(
                                      phoneNumber: formattedPhoneNumber!,
                                      email: emailController.text));
                                } else {
                                  setState(() {
                                    inCorrect = true;
                                  });
                                }
                              }
                            },
                            child: Text('Next',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.body(
                                    color: AppColor.whiteColor)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'By continuing you will receive an SMS for \nverification. Data rates may apply.',
                            style: AppTextStyle.capton(),
                          ),
                        ),
                      ])),
            ),
    );
  }
}
