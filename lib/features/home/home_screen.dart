import 'package:fastaagent/controller/profile_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastaagent/contants/constants.dart';
import '../../controller/agent_controller.dart';
import '../../controller/history_controller.dart';

import 'widget/widget.dart';

class HomeScreen extends StatelessWidget {
  final AgentController userController = Get.put(AgentController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoryController()).getAllHistory();
    Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.brandColor,
        elevation: 0,
      ),
      body: const CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: HomeHeader(),
        ),
        HistoryLabel(),
        HistoryEntryWidget(),
      ]),
    );
  }
}
