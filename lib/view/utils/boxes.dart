import 'package:gym_app/export.dart';

class Boxes {
  static Box<ProfileModel> getProfile() =>
    Hive.box<ProfileModel>('profile');
  
  static Box<TrainModel> getTrain() =>
    Hive.box<TrainModel>('train');
}