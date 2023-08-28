import 'package:fastaagent/apis/models/user_model.dart';
import 'package:fastaagent/controller/profile_controler.dart';
import 'package:fastaagent/controller/user_com.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../apis/models/agent_history_model.dart';
import '../../controller/agent_controller.dart';
import '../../controller/history_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatelessWidget {
  final AgentController userController = Get.put(AgentController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel? user = Get.put(AgentCom()).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.brandColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.38,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(color: AppColor.brandColor),
            child: Column(children: [
              Container(
                width: 300.w,
                height: 165.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColor.mainSecondryColor,
                      AppColor.mainSecondryColor,
                      AppColor.brandColor,
                      AppColor.brandColor,
                      AppColor.brandColor,
                      AppColor.mainSecondryColor,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Invite a Dispatcher",
                        style: AppTextStyle.body(
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: SizedBox(
                                height: 380.h,
                                width: 300.w,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(25),
                                //   color: AppColor.whiteColor,
                                // ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10.h),
                                    Text(
                                      "Scan QR Code",
                                      style: AppTextStyle.body(),
                                    ),
                                    SizedBox(height: 10.h),
                                    GetBuilder<ProfileController>(
                                        builder: (controller) {
                                      if (controller.getAgentProflie?.data.agent
                                              .profileImage !=
                                          null) {
                                        return CircleAvatar(
                                          radius: 40,
                                          backgroundColor: AppColor.brandColor,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image.network(
                                              "${controller.getAgentProflie?.data.agent.profileImage}",
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const CircleAvatar(
                                            radius: 40,
                                            backgroundColor:
                                                AppColor.brandColor,
                                            child: Icon(
                                              Icons.person,
                                              color: AppColor.whiteColor,
                                              size: 60,
                                            ));
                                      }
                                    }),
                                    Text("${user?.data.user.name}",
                                        style: AppTextStyle.capton()),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      child: QrImageView(
                                          data: "${user?.data.user.id}",
                                          size: 200,
                                          errorCorrectionLevel:
                                              QrErrorCorrectLevel.M),
                                    ),
                                    SizedBox(height: 10.h),
                                    Container(
                                      height: 45.h,
                                      width: 150.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.brandColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Continue",
                                          style: AppTextStyle.body(
                                              color: AppColor.whiteColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.qr_code_2,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Invite a dispatcher today and earn 2% from every successful deliveries they have made',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.capton(
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                        width: 120.w,
                        // color: AppColor.whiteColor,
                        child: Stack(
                          children: [
                            Image.asset(
                              AppImages.fa001bg,
                            ),
                            Positioned(
                              left: 18,
                              top: 25,
                              child: Center(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: "${user?.data.user.id}",
                                          ),
                                        );
                                        Get.snackbar(
                                          "Copied",
                                          "Copied to clipboard",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: AppColor.brandColor,
                                          colorText: AppColor.whiteColor,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.copy_rounded,
                                        color: AppColor.brandColor,
                                      ),
                                    ),
                                    SelectableText(
                                      "${user?.data.user.id}",
                                      style: AppTextStyle.body(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.black),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Share.share(
                              'Am Fasta Agent Register with my referial code ${user?.data.user.id} download the app from playstore https://play.google.com/store/apps/details?id=com.fastasmata.fasta or \nfrom AppStore ',
                              subject:
                                  'Am Fasta Agent Register with my referial code');
                        },
                        child: Container(
                          height: 45.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColor.whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              "Invite \nFriends",
                              textAlign: TextAlign.center,
                              style: AppTextStyle.body(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 15.h,
              ),
              GetBuilder<ProfileController>(builder: (controller) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Paymentbutton(
                        title: "Amount Made",
                        subtitle:
                            '${controller.getAgentProflie?.data.totalIncome ?? 0}'),
                    SizedBox(
                      width: 30.w,
                    ),
                    Paymentbutton(
                        title: "Payment Plan",
                        subtitle:
                            '${controller.getAgentProflie?.data.agent.paymentOption ?? "Not set"}'),
                  ],
                );
              })
            ]),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            decoration: const BoxDecoration(color: AppColor.whiteColor),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      "History",
                      style: AppTextStyle.heading2(),
                    ),
                  ),
                  GetBuilder<HistoryController>(builder: (controller) {
                    List<HistoryEntry> historyEntrys = controller.historyEntrys;
                    historyEntrys
                        .sort((a, b) => b.createdAt.compareTo(a.createdAt));
                    return SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: ListView.builder(
                          itemCount: historyEntrys.length,
                          itemBuilder: (context, index) {
                            HistoryEntry historyEntry = historyEntrys[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: AppColor.brandColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            historyEntry.name,
                                            style: AppTextStyle.body(
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                          Text(
                                            "${timeago.format(historyEntry.createdAt, locale: 'en_short')}",
                                            style: AppTextStyle.capton(
                                              color: AppColor.whiteColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        historyEntry.message,
                                        style: AppTextStyle.capton(
                                            color: AppColor.mainSecondryColor),
                                      )
                                    ]),
                              ),
                            );
                          }),
                    );
                  })
                ]),
          )
        ]),
      ),
    );
  }
}

class Paymentbutton extends StatelessWidget {
  final String title;
  final String subtitle;
  const Paymentbutton({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      width: 110.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.whiteColor,
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
