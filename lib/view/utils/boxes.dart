
import 'package:gym_app/model/profile_model.dart';
import 'package:gym_app/model/train_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<ProfileModel> getProfile() =>
    Hive.box<ProfileModel>('profile');
  
  static Box<TrainModel> getTrain() =>
    Hive.box<TrainModel>('train');
}