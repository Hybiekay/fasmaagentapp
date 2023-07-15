import 'package:flutter/material.dart';
import '../../global_widget/form_field.dart';
import '../../global_widget/button_component.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController nameCom;
  late TextEditingController emailCom;
  late TextEditingController phoneCom;
  late TextEditingController bvnCom;
  late TextEditingController ninCom;
  String? dropDownValue;
  @override
  void initState() {
    nameCom = TextEditingController(text: "Jones Angelina");
    emailCom = TextEditingController(text: "jonesangelina@gmail.com");
    phoneCom = TextEditingController(text: "+234 90 6836 8406");
    bvnCom = TextEditingController(text: "12345678901");
    ninCom = TextEditingController(text: "12345678901");
    dropDownValue = "Weekly";
    super.initState();
  }

  @override
  void dispose() {
    nameCom.dispose();
    ninCom.dispose();
    emailCom.dispose();
    phoneCom.dispose();
    bvnCom.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.brandColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.28,
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.18,
                    decoration: const BoxDecoration(
                      color: AppColor.brandColor,
                    ),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Log Out",
                              style:
                                  AppTextStyle.body(color: AppColor.whiteColor),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(AppImages.exitIcon),
                            SizedBox(
                              width: 10.w,
                            ),
                          ],
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 120,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.whiteColor, width: 8),
                                    shape: BoxShape.circle),
                                child: const CircleAvatar(
                                  radius: 70,
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              top: 10,
                              child: CircleAvatar(
                                  backgroundColor: AppColor.mainSecondryColor,
                                  child: Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppColor.whiteColor,
                                  )),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.mainSecondryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text("Active",
                                style: AppTextStyle.capton(
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w700)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ProfileForm(controller: nameCom, label: "Full Name"),
            SizedBox(
              height: 10.h,
            ),
            ProfileForm(controller: emailCom, label: "E-mail"),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Plan",
                      style: AppTextStyle.capton(fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.gray,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      value: dropDownValue,
                      items: [
                        DropdownMenuItem(
                          value: "Weekly",
                          child: Text("Weekly", style: AppTextStyle.capton()),
                        ),
                        DropdownMenuItem(
                            value: "Monthly",
                            child:
                                Text("Monthly", style: AppTextStyle.capton())),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            ProfileForm(
                controller: bvnCom, label: "Bank Verification Number (BVN)"),
            SizedBox(
              height: 10.h,
            ),
            ProfileForm(
                controller: ninCom,
                label: "National Identification Number (NIN)"),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ButtonComp(
                onPressed: () {},
                value: 'Update',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.controller,
    required this.label,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyle.capton(fontWeight: FontWeight.bold)),
        Formfied(
          controller: controller,
          hintText: "",
          suffixIcon:
              GestureDetector(onTap: () {}, child: const Icon(Icons.edit)),
        )
      ],
    );
  }
}
