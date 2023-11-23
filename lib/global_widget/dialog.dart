import 'package:fastaagent/global_widget/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mainshowDialod2({
  required BuildContext context,
  required String value,
  required String bottobText1,
  required String bottobText2,
  required VoidCallback onPressed,
  required VoidCallback onPressed2,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return MainDialog(
        value: value,
        onPressed: onPressed,
        bottobText1: bottobText1,
        bottobText2: bottobText2,
        onPressed2: () {
          Navigator.pop(context);
        },
      );
    },
  );
}

class MainDialog extends StatefulWidget {
  final String value;
  final String bottobText1;
  final String bottobText2;
  final VoidCallback onPressed;
  final VoidCallback onPressed2;

  const MainDialog({
    Key? key,
    required this.value,
    required this.bottobText1,
    required this.bottobText2,
    required this.onPressed,
    required this.onPressed2,
  }) : super(key: key);

  @override
  State<MainDialog> createState() => _MainDialogState();
}

class _MainDialogState extends State<MainDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        widget.value,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp),
      ),
      actions: [
        ButtonComp(onPressed: widget.onPressed, value: widget.bottobText1),
        ButtonComp(onPressed: widget.onPressed2, value: widget.bottobText2)
      ],
    );
  }
}
