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
  }

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  ProfileModel? profile;

  void _loadProfile() {
    profile = Boxes.getProfile().toMap()[0];

    nameController.text = profile?.name ?? '';
    ageController.text = profile?.age.toString() ?? '';
    weightController.text = profile?.weight.toString() ?? '';
    heightController.text = profile?.height.toString() ?? '';
  }

  void createProfile() {
    var profile0 = ProfileModel()
      ..name = ''
      ..age = 0
      ..weight = 0
      ..height = 0;
    Boxes.getProfile().put(0, profile0);

    profile = Boxes.getProfile().get(0);

    nameController.text = profile?.name ?? '';
    ageController.text = profile?.age.toString() ?? '';
    weightController.text = profile?.weight.toString() ?? '';
    heightController.text = profile?.height.toString() ?? '';
  }

  void putInfo() { 
    var profile0 = ProfileModel()
      ..name = nameController.text
      ..age = int.parse(ageController.text)
      ..weight = double.parse(weightController.text)
      ..height = double.parse(heightController.text);
    Boxes.getProfile().put(0, profile0);

    profile = Boxes.getProfile().get(0);

    nameController.text = profile?.name ?? '';
    ageController.text = profile?.age.toString() ?? '';
    weightController.text = profile?.weight.toString() ?? '';
    heightController.text = profile?.height.toString() ?? '';
  }
}
