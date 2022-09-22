import 'package:gym_app/export.dart';

class TrainController extends GetxController {
  TrainModel train = TrainModel();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController setsController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  final ValueNotifier<String> groupNotifier = ValueNotifier('Selecionar');
  final TextEditingController weightController = TextEditingController();

  String day = '';

  TrainController() {
    train.exerciseList = [];
  }

  void createExercise() {
    var exercise = ExerciseModel()
      ..group = 0
      ..title = ''
      ..weight = 0
      ..sets = 0
      ..reps = 0;

    // Boxes.getProfile().put(0, profile0);

    // profile = Boxes.getProfile().get(0);

    // nameController.text = profile?.name ?? '';
    // ageController.text = profile?.age.toString() ?? '';
    // weightController.text = profile?.weight.toString() ?? '';
    // heightController.text = profile?.height.toString() ?? '';
  }

  void putInfo() {
    // var profile0 = ProfileModel()
    //   ..name = nameController.text
    //   ..age = int.parse(ageController.text)
    //   ..weight = double.parse(weightController.text)
    //   ..height = double.parse(heightController.text);
    // Boxes.getProfile().put(0, profile0);

    // profile = Boxes.getProfile().get(0);

    // nameController.text = profile?.name ?? '';
    // ageController.text = profile?.age.toString() ?? '';
    // weightController.text = profile?.weight.toString() ?? '';
    // heightController.text = profile?.height.toString() ?? '';
  }
}
