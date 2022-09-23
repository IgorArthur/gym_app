import 'package:gym_app/exports.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 2)
class ExerciseModel extends HiveObject {

  @HiveField(0)
  late String group;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late double weight;

  @HiveField(3)
  late int sets;

  @HiveField(4)
  late int reps;
}