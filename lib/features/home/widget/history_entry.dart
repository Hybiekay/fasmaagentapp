import 'package:fastaagent/controller/profile_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../apis/models/agent_history_model.dart';
import '../../../apis/models/agent_profile.dart';
import '../../../contants/constants.dart';
import '../../../controller/history_controller.dart';
import '../../dashboard/widget/driver_detail_card.dart';

class HistoryEntryWidget extends StatelessWidget {
  const HistoryEntryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      controller.getAlltheHistory();
      List<HistoryEntry> historyEntrys = controller.historyEntrys;
      historyEntrys.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      if (historyEntrys.isEmpty) {
        return SliverToBoxAdapter(
          child: Center(
              child: Text(
            "No History Yet",
            style: AppTextStyle.body(),
          )),
        );
      } else {
        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            HistoryEntry historyEntry = historyEntrys[index];
            return GestureDetector(
              onTap: () {
                Referral? referral = Get.put(ProfileController())
                    .getDriverbyId(historyEntry.driverId);

                if (referral != null) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                              child: DriverDetialCard(driver: referral)));
                    },
                  );
                } else {
                  Get.snackbar("Error", "Driver not found");
                }
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 70.h,
                decoration: BoxDecoration(
                    color: AppColor.brandColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              historyEntry.name,
                              style: AppTextStyle.body(
                                color: AppColor.whiteColor,
                              ),
                            ),
                            Text(
                              timeago.format(historyEntry.createdAt,
                                  locale: 'en_short'),
                              style: AppTextStyle.capton(
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          historyEntry.message,
                          maxLines: 2,
                          style: AppTextStyle.capton(
                              color: AppColor.mainSecondryColor),
                        )
                      ]),
                ),
              ),
            );
          }, childCount: historyEntrys.length),
        );
      }
    });
  }
}
