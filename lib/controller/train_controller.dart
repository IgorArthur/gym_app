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

  void createExercises() {
    var index = getDayIndex();
    var exerciseList = <ExerciseModel>[];

    Boxes.getExercises().put(index, exerciseList);

    loadExercises();
  }

  void loadExercises() {
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

    loadExercises();
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
