import 'package:get/get.dart';

class BottomNav extends GetxController {
  var currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
