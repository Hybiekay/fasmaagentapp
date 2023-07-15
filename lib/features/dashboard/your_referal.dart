import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/app_colors.dart';
import 'package:fastaagent/contants/app_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourReferer extends StatelessWidget {
  const YourReferer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColor.brandColor,
                    radius: 15.r,
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                  ),
                ),
                const Spacer(),
                Text(
                  "Referrals",
                  style: AppTextStyle.body(fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Total Referral (50)",
            style: AppTextStyle.body(),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Container(
                  height: 203.h,
                  width: 300.w,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColor.brandColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          children: [
                            Text(
                              "Angelina Jones",
                              style:
                                  AppTextStyle.body(color: AppColor.whiteColor),
                            ),
                            Text(
                              "+234 90 6836 8406",
                              style: AppTextStyle.capton(
                                  color: AppColor.whiteColor),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const DetailView(
                        title: "Date Joined", subtitle: "7th May, 2022"),
                    const DetailView(
                        title: "Successful Deliveries", subtitle: "9"),
                    const DetailView(
                        title: "Referral Bonus", subtitle: "₦20,000"),
                    const DetailView(title: "Status", subtitle: "Approved"),
                    const DetailView(title: "Last Delivery", subtitle: "Today"),
                  ]),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  final String title;
  final String subtitle;
  const DetailView({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: AppTextStyle.body(color: AppColor.whiteColor, fontSize: 14),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: AppTextStyle.capton(
                color: AppColor.whiteColor, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    );
  }
}
