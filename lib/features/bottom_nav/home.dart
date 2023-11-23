import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fastaagent/controller/agent_controller.dart';
import 'package:fastaagent/global_widget/dialog.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';
import '../../apis/models/agent_profile.dart';
import '../../controller/history_controller.dart';
import '../../controller/profile_controler.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:fastaagent/features/profile/profile.dart';
import 'package:fastaagent/features/dashboard/dashboard_screen.dart';
import 'package:fastaagent/features/bottom_nav/buttom_nav_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AgentController driverController = Get.put(AgentController());
  final ProfileController profileController = Get.put(ProfileController());
  final HistoryController historyController = Get.put(HistoryController());
  BottomNav bottomNav = Get.put(BottomNav());
  List pages = [HomeScreen(), const DashBoardScreen(), const ProfileScreen()];

  createFirebase() async {
    await FirebaseMessaging.instance.getToken().then((value) async {
      Agent? userData = Get.put(ProfileController()).getAgentDetails;
      if (userData != null && value != userData.fireToken) {
        await driverController.updateTokenDrivers(value!);
      } else {}
    });
  }

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        mainshowDialod2(
            bottobText1: "Don't Allow ",
            bottobText2: " Allow ",
            onPressed2: () => AwesomeNotifications()
                .requestPermissionToSendNotifications()
                .then((value) => Navigator.pop(context)),
            context: context,
            onPressed: () => AwesomeNotifications()
                .requestPermissionToSendNotifications()
                .then((value) => Navigator.pop(context)),
            value:
                "To use notification on this app, you need to allow the notifications press the Botton below to Allow!");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNav>(builder: (context) {
      createFirebase();
      historyController.getAllHistory();

      profileController.getAgentData();
      return UpgradeAlert(
        upgrader: Upgrader(
          dialogStyle: UpgradeDialogStyle.material,
        ),
        child: Scaffold(
          body: pages[context.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.changeIndex(index);
            },
            currentIndex: context.currentIndex.value,
            selectedItemColor: AppColor.black,
            unselectedItemColor: AppColor.black,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: context.currentIndex.value == 0
                          ? Border.all(color: AppColor.black)
                          : null,
                    ),
                    child: Image.asset(AppImages.homeIcon)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: context.currentIndex.value == 1
                        ? Border.all(color: AppColor.black)
                        : null,
                  ),
                  child: const Icon(
                    Icons.dashboard,
                    color: AppColor.black,
                  ),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: context.currentIndex.value == 2
                          ? Border.all(color: AppColor.black)
                          : null,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: AppColor.black,
                    ),
                  ),
                  label: 'Profile'),
            ],
          ),
        ),
      );
    });
  }
}
