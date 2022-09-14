import 'package:gym_app/export.dart';

part 'train_model.g.dart';

@HiveType(typeId: 1)
class TrainModel extends HiveObject {

  @HiveField(0)
  late String title;

  @HiveField(1)
  late String type;

  @HiveField(2)
  late int group;

  @HiveField(3)
  late int time;

  @HiveField(4)
  late List<ExerciseModel> exerciseList;

  bool initialized = false;
}

class ExerciseModel {
  late int group;
  late String title;
  late double weight;
  late int sets;
  late int reps;
}

// @HiveType(typeId: 2)
// class ExerciseModel extends HiveObject {

//   @HiveField(0)
//   late int group;

//   @HiveField(1)
//   late String title;

//   @HiveField(2)
//   late double weight;

//   @HiveField(3)
//   late int sets;

//   @HiveField(4)
//   late int reps;
// }
