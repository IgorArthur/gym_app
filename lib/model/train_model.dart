class TrainModel {
  TrainModel({
    required this.title,
    required this.type,
    required this.group,
    required this.time,
    required this.exerciseList,
  });

  String title;
  String type;
  int group;
  int time;
  List<ExerciseModel> exerciseList;
}

class ExerciseModel {
  ExerciseModel({
    required this.group,
    required this.title,
    required this.weight,
    required this.sets,
    required this.reps,
  });

  int group;
  String title;
  double weight;
  int sets;
  int reps;
}
