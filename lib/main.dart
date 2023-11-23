import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fastaagent/apis/models/user_model.dart';
import 'package:fastaagent/contants/app_colors.dart';
import 'package:fastaagent/controller/user_com.dart';
import 'package:fastaagent/features/bottom_nav/home.dart';
import 'package:fastaagent/features/notification/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/app_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastaagent/ob/onBoardScreen/onboard_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'controller/secure_storage.dart';
import 'features/auth/sign_in/sign_in.dart';
import 'features/auth/sign_up/d_register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (isAllowed) {
      AwesomeNotifications().initialize(null, [
        NotificationChannel(
          channelKey: "fasta_key",
          channelName: "Fasta",
          channelDescription: "Fasta Notification",
          defaultColor: AppColor.mainColor,
          ledColor: AppColor.brandColor,
          channelShowBadge: true,
          playSound: true,
          importance: NotificationImportance.High,
        ),
      ]);
    } else {
      // Permission is not granted, handle accordingly
      print('Notification permission is not granted');
      // You can show a message to the user or request permission explicitly.
    }
  });

  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification}');
    if (message.notification != null) {
      print(message.notification!.body);
      print(message.notification!.title);
      Notify.sendNotice(
        title: "${message.notification!.title}",
        body: "${message.notification!.body}",
      );
    }
  });
  runApp(const FastaAgent());
}

class FastaAgent extends StatelessWidget {
  const FastaAgent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AgentCom());
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
    Future.delayed(const Duration(seconds: 3), () async {
      var globalToken = await AStorage.getDriverToken();
      if (globalToken != null) {
        bool hasExpired = JwtDecoder.isExpired(globalToken);
        if (!hasExpired) {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(globalToken);
          log(decodedToken.toString());

          var allData = await AStorage.getDriverData();
          if (allData != null) {
            UserModel? user = Get.put(AgentCom()).getUser;
            log('Secure storage has data: $allData');

            if (user!.data.user.accountName == null ||
                user.data.user.accountNumber == null ||
                user.data.user.bankName == null) {
              Get.offAll(() => AddBankDetails(
                    phoneNum: user.data.user.phone ?? '',
                  ));
            } else if (user.data.user.accountName != null &&
                user.data.user.accountNumber != null &&
                user.data.user.bankName != null) {
              Get.offAll(() => const HomePage());
            } else {
              Get.offAll(() => const SignIn());
            }
          } else {
            log('Secure storage is empty');
            Get.offAll(() => const OnboardingScreen());
          }
        } else {
          Map<String, dynamic> decodedToken = JwtDecoder.decode(globalToken);
          log(decodedToken.toString());
          log('Token has expired');
          Get.offAll(() => const SignIn());
        }
      } else {
        Get.offAll(() => const OnboardingScreen());
      }
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

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  final map = message.toMap();

  print('background message ${map.toString()}');
  final data = map['data'];
  print(data);
  if (data.containsKey('type')) {
    final messageType = data['type'];

    if (messageType == "text") {
      print(map['data']["messageContent"]);
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) return;
      await Notify.sendNotice(
        title: map['data']["title"],
        body: map['data']["messageContent"],
      );
    }
  }
}
