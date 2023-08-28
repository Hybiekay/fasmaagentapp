import 'package:intl/intl.dart';
import 'package:fastaagent/controller/profile_controler.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/app_colors.dart';
import 'package:fastaagent/contants/app_styling.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../apis/models/agent_profile.dart';

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
          GetBuilder<ProfileController>(builder: (con) {
            return Text(
              "Total Referral (${con.getAllMyDriver.length})",
              style: AppTextStyle.body(),
            );
          }),
          SizedBox(height: 10.h),
          Expanded(
            child: GetBuilder<ProfileController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.getAllMyDriver.length,
                itemBuilder: (context, index) {
                  Referral driver = controller.getAllMyDriver[index];
                  return Container(
                    height: 203.h,
                    width: 300.w,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
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
                                "${driver.name}",
                                style: AppTextStyle.body(
                                    color: AppColor.whiteColor),
                              ),
                              Text(
                                "${driver.phone}",
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
                      DetailView(
                          title: "Date Joined",
                          subtitle:
                              "${DateFormat().format(DateTime.parse(driver.createdAt!))}"),
                      const DetailView(
                          title: "Successful Deliveries", subtitle: "9"),
                      DetailView(
                          title: "Referral Bonus",
                          subtitle: "${driver.totalReferralBonus}"),
                      DetailView(title: "Status", subtitle: "${driver.status}"),
                      DetailView(
                          title: "Last Delivery",
                          subtitle:
                              "${DateFormat().format(DateTime.parse(driver.lastDelivery!))}"),
                    ]),
                  );
                },
              );
            }),
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
