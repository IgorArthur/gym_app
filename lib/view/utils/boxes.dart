import 'package:gym_app/exports.dart';

class Boxes {
  static Box<ProfileModel> getProfile() =>
    Hive.box<ProfileModel>('profile');
  
  static Box<TrainModel> getTrains() =>
    Hive.box<TrainModel>('train');

  static Box<List<dynamic>> getExercises() =>
    Hive.box<List<dynamic>>('exercises');
  
}