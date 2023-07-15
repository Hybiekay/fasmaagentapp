import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                              child: Container(
                                height: 360.h,
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
                                    const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: AppColor.brandColor,
                                        child: Icon(
                                          Icons.person,
                                          color: AppColor.whiteColor,
                                          size: 60,
                                        )),
                                    Text("Jones Angelina",
                                        style: AppTextStyle.capton()),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      child: QrImageView(
                                          data: "https://getequippedfirst.com/",
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
                                    const Icon(
                                      Icons.copy_rounded,
                                      color: AppColor.brandColor,
                                    ),
                                    Text("FA001",
                                        style: AppTextStyle.body(
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.black)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 45.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.whiteColor,
                        ),
                        child: Text(
                          "Invite Friends",
                          textAlign: TextAlign.center,
                          style: AppTextStyle.body(
                            fontWeight: FontWeight.bold,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Paymentbutton(
                      title: "Amount Made", subtitle: '₦35,000.67'),
                  SizedBox(
                    width: 30.w,
                  ),
                  const Paymentbutton(
                      title: "Payment Plan", subtitle: "Weekly"),
                ],
              )
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
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    child: ListView.builder(
                      itemCount: 13,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: 60.h,
                        decoration: BoxDecoration(
                            color: AppColor.brandColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Bosemide Akim",
                                      style: AppTextStyle.body(
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                    Text(
                                      "3 min",
                                      style: AppTextStyle.capton(
                                        color: AppColor.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "+2% from successful delivery",
                                  style: AppTextStyle.capton(
                                      color: AppColor.mainSecondryColor),
                                )
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
