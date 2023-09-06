import 'dart:convert';
import 'dart:developer';

import 'package:fastaagent/controller/agent_controller.dart';
import 'package:fastaagent/controller/secure_storage.dart';
import 'package:get/get.dart';

import '../apis/models/agent_history_model.dart';

class HistoryController extends GetxController {
  AgentController userController = Get.put(AgentController());
  AgentHistory? _agentHistory;
  List<HistoryEntry> _historyEntrys = [];
  // AgentHistory? get agentHistory => _agentHistory;
  List<HistoryEntry> get historyEntrys => _historyEntrys;
  @override
  void onInit() {
    getAllHistory();
    getAlltheHistory();
    super.onInit();
  }

  getAllHistory() async {
    var agentHistory = await userController.getHistory();
    _agentHistory = agentHistory;
    update();
  }

  getAlltheHistory() async {
    if (_agentHistory != null) {
      _historyEntrys = _agentHistory!.data;
      update();
    } else {
      var res = await AStorage.getHistory();
      log("this is secure to ${res.toString()}");
      log("this is secure to ${res.toString()}");
      if (res != null) {
        AgentHistory his = AgentHistory.fromJson(json.decode(res));
        _historyEntrys = his.data;
        update();
      }
    }
  }
}
