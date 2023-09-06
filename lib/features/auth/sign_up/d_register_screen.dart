import 'package:fastaagent/core/dailo.dart';
import 'package:fastaagent/features/auth/sign_in/sign_in.dart';
import 'package:fastaagent/global_widget/loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../contants/constants.dart';
import '../../../controller/agent_controller.dart';
import '../../../global_widget/button_component.dart';

import 'package:fastaagent/global_widget/form_field.dart';

class AddBankDetails extends StatefulWidget {
  final String phoneNum;
  const AddBankDetails({super.key, required this.phoneNum});

  @override
  State<AddBankDetails> createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetails> {
  AgentController driverController = Get.put(AgentController());

  TextEditingController acountNumCon = TextEditingController();
  TextEditingController acountNameCon = TextEditingController();
  TextEditingController bankNameCon = TextEditingController();
  bool isComplete = false;
  String dropDownvalue = "Monthly";
  bool isLoading = false;
  @override
  void initState() {
    //  DStorage.driverlogOut();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: isLoading
          ? const Loader()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 70),
                    Text("Please enter correct information in the box",
                        style: AppTextStyle.heading2()),
                    const SizedBox(height: 30),
                    Text("Bank Name", style: AppTextStyle.capton()),
                    Formfied(
                        controller: bankNameCon,
                        hintText: "Bank Name",
                        keyboardType: TextInputType.name),
                    const SizedBox(height: 30),
                    Text("Account Number", style: AppTextStyle.capton()),
                    Formfied(
                      controller: acountNumCon,
                      hintText: "Account Number",
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 30),
                    Text("Account Name", style: AppTextStyle.capton()),
                    Formfied(
                      controller: acountNameCon,
                      hintText: 'Account Name',
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20),
                        margin: const EdgeInsets.symmetric(horizontal: 5)
                            .copyWith(right: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.mainSecondryColor),
                          color: AppColor.brandColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField(
                            borderRadius: BorderRadius.circular(20),
                            alignment: Alignment.center,
                            value: dropDownvalue,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            icon: const Icon(Icons.arrow_drop_down_outlined),
                            dropdownColor: AppColor.mainSecondryColor,
                            items: [
                              DropdownMenuItem(
                                value: "Weekly",
                                child: Center(
                                  child: Text("Weekly",
                                      style: AppTextStyle.body(
                                          color: AppColor.mainColor)),
                                ),
                              ),
                              DropdownMenuItem(
                                value: "Monthly",
                                child: Center(
                                  child: Text(
                                    "Monthly",
                                    style: AppTextStyle.capton(
                                        color: AppColor.mainColor),
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (v) {
                              setState(() {
                                v = dropDownvalue;
                              });
                              if (acountNameCon.text == "" ||
                                  acountNumCon.text == '' ||
                                  bankNameCon.text == '') {
                                setState(() {
                                  isComplete = false;
                                });
                                Get.snackbar("Notice", "All Feild Are Required",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else {
                                setState(() {
                                  isComplete = true;
                                });
                              }
                            }),
                      ),
                    ),
                    const SizedBox(height: 100),
                    isComplete
                        ? ButtonComp(
                            onPressed: () async {
                              if (bankNameCon.text.isEmpty ||
                                  bankNameCon.text.length < 3) {
                              } else if (acountNumCon.text.isEmpty ||
                                  acountNumCon.text.length < 10) {
                                Get.snackbar("Notice",
                                    "Account Number is Invalid, it should be 10 digit",
                                    snackPosition: SnackPosition.BOTTOM);
                              } else if (acountNameCon.text.isEmpty) {
                              } else {
                                setState(() {
                                  isLoading = true;
                                });
                                final data = await driverController.updateName(
                                    driverAccName: acountNameCon.text,
                                    driverAccNum: acountNumCon.text,
                                    driverBank: bankNameCon.text,
                                    paymentOption: dropDownvalue);
                                setState(() {
                                  isLoading = false;
                                });
                                if (data != null &&
                                    data["user"]["bankName"] != null &&
                                    data["user"]["accountNumber"] != null &&
                                    data["user"]["accountNumber"] != null) {
                                  // ignore: use_build_context_synchronously
                                  successShowDialod(
                                      context: context,
                                      onPressed: () {
                                        Get.off(() => const SignIn());
                                      },
                                      value:
                                          "Your registration has been successfully completed, and you may now log in as a agent.",
                                      bottonValue: "Login");
                                }
                              }
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
}
