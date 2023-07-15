import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'features/bottom_nav/home.dart';
import 'package:fastaagent/contants/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastaagent/ob/onBoardScreen/onboard_screen.dart';


void main() {
  runApp(const FastaAgent());
}

class FastaAgent extends StatelessWidget {
  const FastaAgent({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, u) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fasta Agent',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SlashScreen(),
      );
    });
  }
}

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(() => const OnboardingScreen());
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(AppImages.logoPath),
          SizedBox(height: 100.h),
          Image.asset(
            AppImages.slashImage,
            fit: BoxFit.contain,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
