import 'package:flutter/material.dart';
import '../../contants/constants.dart';

// ignore: must_be_immutable
class SliderWidget extends StatelessWidget {
  double position;
  SliderWidget({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 90,
        height: 6,
        child: Stack(children: <Widget>[
          Container(
              width: 90,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.brandColor,
              )),
          Positioned(
              top: 0,
              left: position,
              child: Container(
                  width: 30,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.mainSecondryColor,
                    border: Border.all(
                      color: AppColor.mainSecondryColor,
                      width: 1,
                    ),
                  ))),
        ]));
  }
}
