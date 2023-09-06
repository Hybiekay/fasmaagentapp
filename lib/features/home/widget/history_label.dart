import 'package:flutter/material.dart';

import '../../../contants/constants.dart';

class HistoryLabel extends StatelessWidget {
  const HistoryLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(color: AppColor.whiteColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text(
            "History",
            style: AppTextStyle.heading2(),
          ),
        ),
      ),
    );
  }
}
