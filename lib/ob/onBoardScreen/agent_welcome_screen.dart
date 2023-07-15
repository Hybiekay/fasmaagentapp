import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastaagent/features/Dispatcherauth/login_screen.dart';

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
                Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.brandColor),
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text('Get Started',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.body(
                              color: AppColor.whiteColor,
                            )),
                      )),
                ),
              ])),
    );
  }
}
