import 'package:flutter/material.dart';

import '../contants/constants.dart';
import '../global_widget/button_component.dart';

successShowDialod({
  required BuildContext context,
  required String value,
  String bottonValue = "Done",
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Image.asset(
          AppImages.successAlertImage,
          height: 100,
          width: 50,
        ),
        title: const Text("Successful"),
        // ignore: prefer_const_constructors
        content: Text(
          value,
          textAlign: TextAlign.center,
        ),
        actions: [ButtonComp(onPressed: onPressed, value: bottonValue)],
      );
    },
  );
}
