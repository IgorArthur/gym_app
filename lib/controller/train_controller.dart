import 'package:gym_app/exports.dart';

class TrainController extends GetxController {
  TrainModel train = TrainModel();
  List<ExerciseModel> exerciseList = <ExerciseModel>[];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final ValueNotifier<String> groupNotifier = ValueNotifier('Selecionar');
  final TextEditingController weightController = TextEditingController();

  String dayName = '';

  // Initialization Methods

  void getinfo() {
    final index = getDayIndex();

    if (Boxes.getExercises().get(index) == null) {
      _createExercises();
    } else {
      _loadExercises();
    }
  }

  void _createExercises() {
    var index = getDayIndex();
    var exerciseList = <ExerciseModel>[];

    Boxes.getExercises().put(index, exerciseList);

    _loadExercises();
  }

  void _loadExercises() {
    var index = getDayIndex();

    exerciseList = Boxes.getExercises().get(index)!.cast<ExerciseModel>();

    //update();
  }

  // Add and Remove Methods

  void addExercise() {
    final exercise = ExerciseModel()
      ..group = groupNotifier.value
      ..title = nameController.text
      ..weight = double.parse(weightController.text)
      ..sets = int.parse(setsController.text)
      ..reps = int.parse(repsController.text);

    exerciseList.add(exercise);

    _modifyTrainInfo();

    _clearFields();

    _modifyExercises();
  }

  void removeExercise(int index) {
    exerciseList.removeAt(index);

    _clearFields();

    _modifyExercises();
  }

  // Hive Methods

  void _modifyExercises() {
    var index = getDayIndex();

    Boxes.getExercises().put(index, exerciseList);

    _loadExercises();
  }

  void _modifyTrainInfo() {
    final groupList = [];

    for (final exercise in exerciseList) {
      groupList.add(exercise.group);
    }

    var popular = {};

    for (var exercise in groupList) {
      if (!popular.containsKey(exercise)) {
        popular[exercise] = 1;
      } else {
        popular[exercise] += 1;
      }
    }

    var sortedByValueMap = Map.fromEntries(popular.entries.toList()
      ..sort((e1, e2) => e2.value.compareTo(e1.value)));

    var title = '';

    if (sortedByValueMap.length > 1) {
      title =
          '${sortedByValueMap.keys.toList()[0]} e ${sortedByValueMap.keys.toList()[1]}';
    } else {
      if (sortedByValueMap.length == 1) {
        title = '${sortedByValueMap.keys.toList()[0]}';
      }
    }

    final duration = sortedByValueMap.length * 5;

    var index = getDayIndex();

    final newTrain = TrainModel();

    newTrain
      ..title = title
      ..time = duration;

    Boxes.getTrains().put(index, newTrain);

    update();
  }

  // Auxiliar Methods

  void _clearFields() {
    groupNotifier.value = 'Selecionar';
    nameController.clear();
    weightController.clear();
    setsController.clear();
    repsController.clear();

    update();
  }

  int getDayIndex() {
    switch (dayName) {
      case 'Segunda-feira':
        return 1;
      case 'Terça-feira':
        return 2;
      case 'Quarta-feira':
        return 3;
      case 'Quinta-feira':
        return 4;
      case 'Sexta-feira':
        return 5;
      case 'Sábado':
        return 6;
      default:
        return 0;
    }
  }
}
