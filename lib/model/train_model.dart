import 'package:gym_app/exports.dart';

part 'train_model.g.dart';

@HiveType(typeId: 1)
class TrainModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(3)
  late int time;

  // @HiveField(4)
  // late List<ExerciseModel> exerciseList;

  bool initialized = false;
}
