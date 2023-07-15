import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../contants/constants.dart';
import 'package:fastaagent/global_widget/verify_field.dart';
import 'package:fastaagent/features/Dispatcherauth/driver_form.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class VerifyScreen extends StatefulWidget {
  final String phoneNumber;
  final String email;
  const VerifyScreen({
    Key? key,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
//  DriverController driverController = Get.put(DriverController());
  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();
  String? code;
  bool isInCorrect = false;
  String statusCode = "1255";
  bool isLoading = false;

  @override
  void initState() {
    isInCorrect = false;

    super.initState();
  }

  getOtp() async {
    // String otp = await DStorage.getDriverOtp();
    // if (kDebugMode) {
    //   print("Otp :$otp");
    // }
    // return otp;
  }

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
                        'Enter the 4-digit code sent to you at \n${widget.phoneNumber} ',
                        style: AppTextStyle.body()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: Row(
                        children: [
                          VerifyField(controller: con1),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          VerifyField(controller: con2),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          VerifyField(controller: con3),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Container(
                              height: 45,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: AppColor.gray,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                style: AppTextStyle.hintText(),
                                controller: con4,
                                onChanged: (value) async {
                                  // String otp = await getOtp();
                                  var code = con1.text +
                                      con2.text +
                                      con3.text +
                                      con4.text;

                                  if (code.length == 4) {
                                    Get.to(() => const AgentFrom());
                                  }

                                  // setState(() {
                                  //   String nevalue = ("$code$value");

                                  //   code = nevalue;
                                  // });
                                  // if (kDebugMode) {
                                  //   print("this is code$code");
                                  // }

                                  // if (otp != code) {
                                  //   setState(() {
                                  //     isInCorrect = true;
                                  //   });
                                  // } else if (otp == code) {
                                  //   setState(() {
                                  //     isLoading = true;
                                  //   });
                                  //   if (kDebugMode) {
                                  //     print(
                                  //         "$otp is the otp, $code is your input");
                                  //   }
                                  // final res = await driverController.getOtp(
                                  //     code: code!,
                                  //     phoneNumber: widget.phoneNumber);
                                  // print("this from here to user$res");

                                  // driverData = await DStorage.getDriverData();
                                  // var storage =
                                  //     await DStorage.getDriverData();

                                  // log("this from here to user$storage");
                                  // if (storage != null) {
                                  //   var data = json.decode(storage);
                                  //   log("this the Storate$storage");
                                  //   log("this the ate${data}");
                                  //   if (data["user"]["name"] == null) {
                                  //     setState(() {
                                  //       isLoading = false;
                                  //     });
                                  //     Get.off(() => DRegisterScreen(
                                  //           phoneNum: widget.phoneNumber,
                                  //         ));
                                  //   } else if (data["user"]["ninImage"] !=
                                  //               null &&
                                  //           data["user"]["dobImageId"] ==
                                  //               null ||
                                  //       data["user"]["nin"] == null ||
                                  //       data["user"]["bvn"] == null) {
                                  //     setState(() {
                                  //       isLoading = false;
                                  //     });
                                  //     Get.offAll(
                                  //         () => DriverForm(
                                  //             name: data["user"]["name"]),
                                  //         arguments: {data});
                                  //   } else if (data["user"]["email"] !=
                                  //           null &&
                                  //       data["user"]["name"] != null &&
                                  //       data["user"]["dobImageId"] != null &&
                                  //       data["user"]["nin"] != null) {
                                  //     setState(() {
                                  //       isLoading = false;
                                  //     });
                                  //     Get.offAll(() => const DispatcherHome(),
                                  //         arguments: {data});
                                  //   }
                                  //   setState(() {
                                  //     isLoading = false;
                                  //   });
                                  // }

                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  } else {
                                    if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                      FocusScope.of(context).previousFocus();
                                      setState(() {
                                        isInCorrect = false;
                                      });
                                    } else if (value.isEmpty) {
                                      FocusScope.of(context).previousFocus();
                                    }
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: "0",
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
                            ? Text("Wrong 4-digit code inputed",
                                style: AppTextStyle.error())
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
                              con1.clear();
                              con2.clear();
                              con3.clear();
                              con4.clear();
                              setState(() {
                                isLoading = true;
                              });
                              // await driverController.loginUser(
                              //     widget.email, widget.phoneNumber);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            child: Text('I didn’t receive a code',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.capton(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w400))),
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
                              style: AppTextStyle.capton(
                                  fontWeight: FontWeight.w400),
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
