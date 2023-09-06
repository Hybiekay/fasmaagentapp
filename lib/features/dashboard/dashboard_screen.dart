import 'package:fastaagent/features/dashboard/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:fastaagent/contants/constants.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.mainSecondryColor, elevation: 0),
      body: const SingleChildScrollView(
        child: Column(children: [DashboardHearder(), AgentData4box()]),
      ),
    );
  }
}
