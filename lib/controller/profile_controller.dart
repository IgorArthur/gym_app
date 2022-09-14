import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gym_app/model/profile_model.dart';
import 'package:gym_app/view/utils/boxes.dart';

class ProfileController extends GetxController {
  ProfileController() {
    if (Boxes.getProfile().isEmpty) {
      createProfile();
    } else {
      _loadProfile();
    }

    Boxes.getTrain();
  }

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  ProfileModel profile = ProfileModel();
  Map<dynamic, ProfileModel> profileMap = <dynamic, ProfileModel>{};

  void _loadProfile() {
    profile = Boxes.getProfile().toMap()[0]!;
  }

  void createProfile() {
    var profile0 = ProfileModel()
      ..name = ''
      ..age = 0
      ..weight = 0
      ..height = 0;
    Boxes.getProfile().put(0, profile0);

    profile = Boxes.getProfile().get(0)!;
  }
}
