import 'dart:convert';
import 'dart:developer';

import 'package:fastaagent/controller/secure_storage.dart';
import 'package:get/get.dart';

import '../apis/models/agent_profile.dart';
import 'agent_controller.dart';

class ProfileController extends GetxController {
  AgentController userController = Get.put(AgentController());
  AgentProfile? _agentProfile;
  Agent? _agent;
  AgentData? _agentData;
  List<Referral> _listOfReferedDrider = [];
  List<Referral> get getAllMyDriver => _listOfReferedDrider;
  Agent? get getAgentDetails => _agent;
  AgentData? get getagentdata => _agentData;

  @override
  void onInit() {
    getAngetDetails();
    getAgentData();
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

  getAgentData() async {
    if (_agentProfile != null) {
      AgentData agentData = _agentProfile!.data;
      _agentData = agentData;
      update();
    } else {
      var res = await AStorage.getAgentProfile();

      if (res != null) {
        log(res);
        AgentProfile agentProfile = AgentProfile.fromJson(json.decode(res));
        AgentData agentData = agentProfile.data;

        log(agentData.toString());
        _agentData = agentData;
        update();
        Agent agent = agentProfile.data.agent;

        _agent = agent;

        update();
        List<Referral> drivers = agentProfile.data.totalReferral;
        _listOfReferedDrider = drivers;

        update();
        getAgent();

        getListOfReferedDriver();
      }
    }
  }

  getAgent() async {
    if (_agentProfile != null) {
      Agent agent = _agentProfile!.data.agent;
      _agent = agent;
      update();
    } else {}
  }

  getListOfReferedDriver() async {
    if (_agentProfile != null) {
      _listOfReferedDrider = [];
      List<Referral> drivers = _agentProfile!.data.totalReferral;
      _listOfReferedDrider = drivers;
      update();
    } else {}
  }

  Referral? getDriverbyId(String id) {
    bool isExist = _listOfReferedDrider.any((element) => element.id == id);
    if (isExist) {
      return _listOfReferedDrider.firstWhere((element) => element.id == id);
    } else {
      return null;
    }
  }
}
