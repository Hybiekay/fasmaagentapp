import 'package:fastaagent/global_widget/button_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import '../../features/auth/sign_in/sign_in.dart';
import '../../features/auth/sign_up/sign_up.dart';

class AgentWelcomeScreen extends StatelessWidget {
  const AgentWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: AppColor.mainColor,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppImages.onboardScreenImage4),
                          fit: BoxFit.fitWidth),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('Ready to get \nStarted as \nan Agent!',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.heading1()),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonComp(
                      onPressed: () {
                        Get.to(() => const SignIn());
                      },
                      value: "Login"),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonComp(
                      onPressed: () {
                        Get.to(() => const SignUp());
                      },
                      value: "Sign Up"),
                ),
              ])),
    );
  }
}
