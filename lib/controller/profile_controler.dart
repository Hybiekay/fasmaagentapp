import 'package:get/get.dart';

import '../apis/models/agent_profile.dart';
import 'agent_controller.dart';

class ProfileController extends GetxController {
  AgentController userController = Get.put(AgentController());
  AgentProfile? _agentProfile;
  Agent? _agent;
  AgentData? _agentData;
  List<Referral> _listOfReferedDrider = [];
  AgentProfile? get getAgentProflie => _agentProfile;
  List<Referral> get getAllMyDriver => _listOfReferedDrider;
  Agent? get getAgentDetails => _agent;
  AgentData? get getagentdata => _agentData;

  @override
  void onInit() {
    getAngetDetails();

    super.onInit();
  }

  getAngetDetails() async {
    AgentProfile? agentProfile = await userController.getprofile();

    _agentProfile = agentProfile;
    update();
    getAgent();
    getAgentData();
    getAngetDetails();
    getListOfReferedDriver();
  }

  getAgentData() {
    if (_agentProfile != null) {
      AgentData agentData = _agentProfile!.data;
      _agentData = agentData;
      update();
    } else {
      Get.snackbar("Error", "Refresh the app");
    }
  }

  getAgent() {
    if (_agentProfile != null) {
      Agent agent = _agentProfile!.data.agent;
      _agent = agent;
      update();
    } else {
      Get.snackbar("Error", "Refresh the app");
    }
  }

  getListOfReferedDriver() {
    if (_agentProfile != null) {
      _listOfReferedDrider = [];
      List<Referral> drivers = _agentProfile!.data.totalReferral;
      _listOfReferedDrider.addAll(drivers);
      update();
    } else {
      Get.snackbar("Error", "Refresh the app");
    }
  }

  //  getListOfRefered() {
  //   if (_agentProfile != null) {
  //     List<ReferedDriver> agent = _agentProfile!.data.totalReferrals;
  //   } else {
  //     Get.snackbar("Error", "Refresh the app");
  //   }
  // }
}
