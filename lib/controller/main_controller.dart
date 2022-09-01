import 'package:get/get.dart';
import 'package:gym_app/model/train_model.dart';
import 'package:gym_app/train_mocks.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  MainController() {
    _getInfo();
  }

  void _getInfo() {
    final today = DateFormat('EEEE').format(DateTime.now());

    switch (today) {
      case 'Monday':
        currentDay = 1;
        trainList.add(mondayTrain);
        break;
      case 'Tuesday':
        currentDay = 2;
        trainList.add(tuesdayTrain);
        break;
      case 'Wednesday':
        currentDay = 3;
        trainList.add(wednesdayTrain);
        break;
      case 'Thursday':
        currentDay = 4;
        trainList.add(thursdayTrain);
        break;
      case 'Friday':
        currentDay = 5;
        trainList.add(fridayTrain);
        break;
      case 'Saturday':
        currentDay = 6;
        break;
      default:
        currentDay = 0;
        break;
    }
  }

  int currentDay = 0;

  List<TrainModel> trainList = <TrainModel>[
    TrainModel(
      title: 'Aquecimento',
      type: 'Esteira ou bicicleta',
      time: 5,
      exerciseList: [],
    )
  ];
}
