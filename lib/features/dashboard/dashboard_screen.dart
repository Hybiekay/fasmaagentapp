import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastaagent/features/dashboard/your_referal.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.brandColor, elevation: 0),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.32,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: AppColor.brandColor),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Brief Metrics",
                      style: AppTextStyle.body(color: AppColor.whiteColor),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: 70,
                        height: 25,
                        decoration: BoxDecoration(
                            color: AppColor.mainSecondryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Today",
                                style: AppTextStyle.capton(
                                    color: AppColor.whiteColor),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: AppColor.whiteColor,
                              )
                            ],
                          ),
                        )),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const YourReferer());
                        },
                        child: Image.asset(AppImages.reficon)),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.h,
                  ),
                  const Chart(
                    todayIncome: 50 / 100,
                    todayActiveReferral: 60 / 100,
                    todayCompletedDeliveries: 35 / 100,
                    todayReferredDispatcher: 70 / 100,
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ColorAndText(
                        color: AppColor.mainSecondryColor,
                        text: "Today’s Income",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ColorAndText(
                        color: AppColor.blue,
                        text: "Today’s Active Referral",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ColorAndText(
                        color: AppColor.orange,
                        text: "Today’s Completed Deliveries",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ColorAndText(
                        color: AppColor.amber,
                        text: "Today’s Referred Dispatcher",
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const ColorAndText(
                        color: AppColor.whiteColor,
                        text: "Previous day metrics",
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  )
                ],
              )
            ]),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.7,
            decoration: const BoxDecoration(color: AppColor.whiteColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        // height: 50.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            color: AppColor.brandColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "₦50,000",
                                  style: AppTextStyle.body(
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  "Today’s Income",
                                  style: AppTextStyle.capton(
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}

class ColorAndText extends StatelessWidget {
  final Color color;
  final String text;
  const ColorAndText({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppTextStyle.capton(color: AppColor.whiteColor, fontSize: 12),
        ),
      ],
    );
  }
}

class Chart extends StatelessWidget {
  final double todayIncome;
  final double todayReferredDispatcher;
  final double todayActiveReferral;
  final double todayCompletedDeliveries;
  const Chart({
    super.key,
    required this.todayIncome,
    required this.todayReferredDispatcher,
    required this.todayActiveReferral,
    required this.todayCompletedDeliveries,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              value: todayIncome,
              strokeWidth: 8,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColor.mainSecondryColor),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Center(
              child: SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  value: todayActiveReferral,
                  strokeWidth: 8,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColor.blue),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Center(
              child: SizedBox(
                height: 110,
                width: 110,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  value: todayCompletedDeliveries,
                  strokeWidth: 8,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColor.orange),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Center(
              child: SizedBox(
                height: 90,
                width: 90,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.white,
                  value: todayReferredDispatcher,
                  strokeWidth: 8,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColor.amber),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String title;
  final String subtitle;
  const Card({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 110.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.brandColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyle.body(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColor.brandColor),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyle.capton(
                fontWeight: FontWeight.w400, color: AppColor.mainSecondryColor),
          ),
        ],
      ),
    );
  }
}
