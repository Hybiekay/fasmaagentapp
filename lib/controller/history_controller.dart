import 'package:fastaagent/controller/agent_controller.dart';
import 'package:get/get.dart';

import '../apis/models/agent_history_model.dart';

class HistoryController extends GetxController {
  AgentController userController = Get.put(AgentController());
  AgentHistory? _agentHistory;
  List<HistoryEntry> _historyEntrys = [];
  AgentHistory? get agentHistory => _agentHistory;
  List<HistoryEntry> get historyEntrys => _historyEntrys;
  @override
  void onInit() {
    getAlltheHistory();
    super.onInit();
  }

  getAlltheHistory() async {
    var agentHistory = await userController.getHistory();
    _agentHistory = agentHistory;

    update();
    if (agentHistory != null) {
      _historyEntrys = agentHistory.data;
      update();
    }
  }
}
