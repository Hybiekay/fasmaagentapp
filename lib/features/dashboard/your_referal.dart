import 'package:fastaagent/controller/profile_controler.dart';
import 'package:fastaagent/features/dashboard/widget/driver_detail_card.dart';
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
              if (controller.getAllMyDriver.isEmpty) {
                return Center(
                  child: Text(
                    "No Referral Yet",
                    style: AppTextStyle.body(),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: controller.getAllMyDriver.length,
                  itemBuilder: (context, index) {
                    Referral driver = controller.getAllMyDriver[index];

                    return DriverDetialCard(driver: driver);
                  },
                );
              }
            }),
          )
        ]),
      ),
    );
  }
}
