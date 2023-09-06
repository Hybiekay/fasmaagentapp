import 'dart:async';
import 'package:flutter/material.dart';
import '../../contants/constants.dart';
import 'package:fastaagent/ob/onBoardScreen/slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastaagent/ob/onBoardScreen/agent_welcome_screen.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
  });

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == 2) {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic);
      } else {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCubic);
      }
    });
    super.initState();
  }

  List<Widget> pages = const [
    OnbodingWidget(),
    OnboardingScreen2(),
    OnboadingWidget3(),
    AgentWelcomeScreen(),
  ];

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: PageView.builder(
          onPageChanged: (value) {
            // if (value == 3) {
            //   _timer?.cancel();
            //   Get.offAll(() => const AgentWelcomeScreen());
            // }
          },
          itemCount: pages.length,
          controller: _pageController,
          itemBuilder: (context, index) {
            return pages[index];
          }),
    );
  }
}

class OnbodingWidget extends StatelessWidget {
  const OnbodingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColor.mainColor,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                width: 250,
                height: MediaQuery.of(context).size.height * 0.38,
                child: Image.asset(AppImages.onboardScreenImage1,
                    fit: BoxFit.fitWidth),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Text("Share Your Referral Code",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.heading2()),
                        ),
                        Text(
                            "Share your unique referral link with dispatchers you know or anyone interested in joining Fasta.",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.body()),
                        SliderWidget(
                          position: 0,
                        ),
                      ])),
            ]));
  }
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: AppColor.mainColor,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                width: 250,
                height: MediaQuery.of(context).size.height * 0.38,
                child: Image.asset(AppImages.onboardScreenImage2,
                    fit: BoxFit.fitWidth),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Text('Earn 2% Of Their Earnings',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.heading2()),
                        ),
                        Text(
                            "For every dispatcher you refer, you'll earn a 2% commission on their earnings, for as long as they use Fasta.",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.body()),
                        SliderWidget(
                          position: 30,
                        ),
                      ])),
            ]));
  }
}

class OnboadingWidget3 extends StatelessWidget {
  const OnboadingWidget3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: AppColor.mainColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              SizedBox(
                width: 250,
                height: MediaQuery.of(context).size.height * 0.38,
                child: Image.asset(AppImages.onboardScreenImage3,
                    fit: BoxFit.fitWidth),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(
                          child: Text("Track Your Earnings",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.heading2()),
                        ),
                        Text(
                            "Keep track of your earnings and referrals right from the app. Get paid effortlessly.",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.body()),
                        SliderWidget(
                          position: 60,
                        ),
                      ])),
            ]));
  }
}
