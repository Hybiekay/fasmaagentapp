import 'dart:convert';

import 'package:fastaagent/apis/models/user_model.dart';
import 'package:fastaagent/controller/secure_storage.dart';
import 'package:get/get.dart';

class AgentCom extends GetxController {
  UserModel? _driverDetails;
  UserModel? get getUser => _driverDetails;
  @override
  void onInit() {
    super.onInit();
    updateUser();
  }

  updateUser() async {
    var str = await AStorage.getDriverData();
    if (str != null) {
      var user = UserModel.fromJson(json.decode(str));
      _driverDetails = user;
      update();
    }
  }
}
