import 'package:get/get.dart';
import '../../controller/history_controller.dart';
import '../../controller/profile_controler.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';
import 'package:fastaagent/features/profile/profile.dart';
import 'package:fastaagent/features/dashboard/dashboard_screen.dart';
import 'package:fastaagent/features/bottom_nav/buttom_nav_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProfileController profileController = Get.put(ProfileController());
  final HistoryController historyController = Get.put(HistoryController());
  BottomNav bottomNav = Get.put(BottomNav());
  List pages = [HomeScreen(), const DashBoardScreen(), const ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    historyController.getAlltheHistory();
    return GetBuilder<BottomNav>(builder: (context) {
      historyController.getAlltheHistory();
      return Scaffold(
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
              icon: Image.asset(AppImages.homeIcon),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: AppColor.black,
              ),
              label: 'Dashboard',
            ),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: AppColor.black,
                ),
                label: 'Profile'),
          ],
        ),
      );
    });
  }
}
