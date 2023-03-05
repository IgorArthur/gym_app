import 'package:gym_app/exports.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  int currentDayIndex = 0;
  String currentDayName = '';

  TrainModel? train;

  // Initialization Methods

  MainController() {
    loadInfo();
  }

  loadInfo() {
    if (Boxes.getTrains().isEmpty) {
      _createTrain();
    } else {
      _loadTrains();
    }
  }

  void _createTrain() {
    var train0 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(0, train0);

    var train1 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(1, train1);

    var train2 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(2, train2);

    var train3 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(3, train3);

    var train4 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(4, train4);

    var train5 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(5, train5);

    var train6 = TrainModel()
      ..title = ''
      ..time = 0;
    Boxes.getTrains().put(6, train6);

    _loadTrains();
  }

  void _loadTrains() {
    final today = DateFormat('EEEE').format(DateTime.now());

    switch (today) {
      case 'Monday':
        currentDayIndex = 1;
        currentDayName = 'Segunda-feira';
        train = Boxes.getTrains().toMap()[1];

        break;
      case 'Tuesday':
        currentDayIndex = 2;
        currentDayName = 'Terça-feira';
        train = Boxes.getTrains().toMap()[2];

        break;
      case 'Wednesday':
        currentDayIndex = 3;
        currentDayName = 'Quarta-feira';
        train = Boxes.getTrains().toMap()[3];

        break;
      case 'Thursday':
        currentDayIndex = 4;
        currentDayName = 'Quinta-feira';
        train = Boxes.getTrains().toMap()[4];

        break;
      case 'Friday':
        currentDayIndex = 5;
        currentDayName = 'Sexta-feira';
        train = Boxes.getTrains().toMap()[5];

        break;
      case 'Saturday':
        currentDayIndex = 6;
        currentDayName = 'Sábado';
        train = Boxes.getTrains().toMap()[6];

        break;
      default:
        currentDayIndex = 0;
        currentDayName = 'Domingo';
        train = Boxes.getTrains().toMap()[0];

        break;
    }

    update();
  }

  void changeCurrentDay(int newDay) {
    currentDayIndex = newDay;

    switch (newDay) {
      case 1:
        currentDayName = 'Segunda-feira';
        train = Boxes.getTrains().toMap()[1];

        break;
      case 2:
        currentDayName = 'Terça-feira';
        train = Boxes.getTrains().toMap()[2];

        break;
      case 3:
        currentDayName = 'Quarta-feira';
        train = Boxes.getTrains().toMap()[3];

        break;
      case 4:
        currentDayName = 'Quinta-feira';
        train = Boxes.getTrains().toMap()[4];

        break;
      case 5:
        currentDayName = 'Sexta-feira';
        train = Boxes.getTrains().toMap()[5];

        break;
      case 6:
        currentDayName = 'Sábado';
        train = Boxes.getTrains().toMap()[6];

        break;
      default:
        currentDayName = 'Domingo';
        train = Boxes.getTrains().toMap()[0];

        break;
    }

    update();
  }
}
