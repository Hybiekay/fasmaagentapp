import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fastaagent/global_widget/button_component.dart';
import 'package:fastaagent/global_widget/dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import '../../features/auth/sign_in/sign_in.dart';
import '../../features/auth/sign_up/sign_up.dart';

class AgentWelcomeScreen extends StatefulWidget {
  const AgentWelcomeScreen({super.key});

  @override
  State<AgentWelcomeScreen> createState() => _AgentWelcomeScreenState();
}

class _AgentWelcomeScreenState extends State<AgentWelcomeScreen> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        mainshowDialod2(
            bottobText1: "Don't Allow ",
            bottobText2: " Allow ",
            onPressed2: () => AwesomeNotifications()
                .requestPermissionToSendNotifications()
                .then((value) => Navigator.pop(context)),
            context: context,
            onPressed: () => AwesomeNotifications()
                .requestPermissionToSendNotifications()
                .then((value) => Navigator.pop(context)),
            value:
                "To use notification on this app, you need to allow the notifications press the Botton below to Allow!");
      }
    });
    super.initState();
  }

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
