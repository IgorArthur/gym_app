import 'package:get/get.dart';
import 'package:gym_app/model/train_model.dart';
import 'package:gym_app/train_mocks.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  MainController() {
    _getInfo();
  }

  int currentDayIndex = 0;
  String currentDayName = '';

  TrainModel aquecimento = TrainModel(
    title: 'Aquecimento',
    type: 'Esteira ou bicicleta',
    group: 0,
    time: 5,
    exerciseList: [],
  );

  List<TrainModel> trainList = <TrainModel>[];

  void _getInfo() {
    final today = DateFormat('EEEE').format(DateTime.now());

    switch (today) {
      case 'Monday':
        currentDayIndex = 1;
        currentDayName = 'Segunda-feira';
        trainList = List.from([aquecimento, mondayTrain]);
        break;
      case 'Tuesday':
        currentDayIndex = 2;
        currentDayName = 'Terça-feira';
        trainList = List.from([aquecimento, tuesdayTrain]);
        break;
      case 'Wednesday':
        currentDayIndex = 3;
        currentDayName = 'Quarta-feira';
        trainList = List.from([aquecimento, wednesdayTrain]);
        break;
      case 'Thursday':
        currentDayIndex = 4;
        currentDayName = 'Quinta-feira';
        trainList = List.from([aquecimento, thursdayTrain]);
        break;
      case 'Friday':
        currentDayIndex = 5;
        currentDayName = 'Sexta-feira';
        trainList = List.from([aquecimento, fridayTrain]);
        break;
      case 'Saturday':
        currentDayIndex = 6;
        currentDayName = 'Sábado';
        trainList = List.from([]);
        break;
      default:
        currentDayIndex = 0;
        currentDayName = 'Domingo';
        trainList = List.from([]);
        break;
    }
  }

  void changeCurrentDay(int newDay) {
    currentDayIndex = newDay;

    switch (newDay) {
      case 1:
        trainList = List.from([aquecimento, mondayTrain]);
        currentDayName = 'Segunda-feira';
        break;
      case 2:
        trainList = List.from([aquecimento, tuesdayTrain]);
        currentDayName = 'Terça-feira';
        break;
      case 3:
        trainList = List.from([aquecimento, wednesdayTrain]);
        currentDayName = 'Quarta-feira';
        break;
      case 4:
        trainList = List.from([aquecimento, thursdayTrain]);
        currentDayName = 'Quinta-feira';
        break;
      case 5:
        trainList = List.from([aquecimento, fridayTrain]);
        currentDayName = 'Sexta-feira';
        break;
      case 6:
        trainList = List.from([]);
        currentDayName = 'Sábado';
        break;
      default:
        trainList = List.from([]);
        currentDayName = 'Domingo';
        break;
    }

    update();
  }
}
