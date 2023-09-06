import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../apis/models/agent_profile.dart';
import '../../../contants/constants.dart';
import '../../../controller/profile_controler.dart';

class AgentData4box extends StatelessWidget {
  const AgentData4box({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      AgentData? agentData = controller.getagentdata;
      return Container(
        height: MediaQuery.sizeOf(context).height * 0.7,
        decoration: const BoxDecoration(color: AppColor.whiteColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  DashBoardBox(
                    value: "${agentData?.totalIncome ?? 00}",
                    label: "Today’s Income",
                  ),
                  DashBoardBox(
                    value: "${agentData?.totalActiveReferralsCounts ?? 0}",
                    label: "Today’s Active Referral",
                  )
                ],
              ),
              Row(
                children: [
                  DashBoardBox(
                    value:
                        "${agentData?.totalCompletedDeliveriesCounts.length ?? 0}",
                    label: "Today’s Completed Deliveries",
                  ),
                  DashBoardBox(
                    value: "${agentData?.totalReferralsCounts ?? 0} ",
                    label: "Today’s Referred Dispatcher",
                  )
                ],
              )
            ]),
      );
    });
  }
}

class DashBoardBox extends StatelessWidget {
  final String label;
  final String value;

  const DashBoardBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 170.h,
      width: 160.w,
      decoration: BoxDecoration(
          color: AppColor.brandColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: AppTextStyle.body(
                  color: AppColor.whiteColor,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyle.capton(
                  color: AppColor.whiteColor,
                ),
              ),
            ]),
      ),
    );
  }
}
