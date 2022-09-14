import 'package:get/get.dart';
import 'package:gym_app/model/train_model.dart';
import 'package:gym_app/view/utils/boxes.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  MainController() {
    if (Boxes.getTrain().isEmpty) {
      createTrain();
    } else {
      _loadTrains();
    }
  }

  int currentDayIndex = 0;
  String currentDayName = '';

  TrainModel? train;

  void _loadTrains() {
    final today = DateFormat('EEEE').format(DateTime.now());

    switch (today) {
      case 'Monday':
        currentDayIndex = 1;
        currentDayName = 'Segunda-feira';
        train = Boxes.getTrain().toMap()[1];

        break;
      case 'Tuesday':
        currentDayIndex = 2;
        currentDayName = 'Terça-feira';
        train = Boxes.getTrain().toMap()[2];

        break;
      case 'Wednesday':
        currentDayIndex = 3;
        currentDayName = 'Quarta-feira';
        train = Boxes.getTrain().toMap()[3];

        break;
      case 'Thursday':
        currentDayIndex = 4;
        currentDayName = 'Quinta-feira';
        train = Boxes.getTrain().toMap()[4];

        break;
      case 'Friday':
        currentDayIndex = 5;
        currentDayName = 'Sexta-feira';
        train = Boxes.getTrain().toMap()[5];

        break;
      case 'Saturday':
        currentDayIndex = 6;
        currentDayName = 'Sábado';
        train = Boxes.getTrain().toMap()[6];

        break;
      default:
        currentDayIndex = 0;
        currentDayName = 'Domingo';
        train = Boxes.getTrain().toMap()[0];

        break;
    }

    
    update();
  }

  void createTrain() {
    var train0 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(0, train0);

    var train1 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(1, train1);

    var train2 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(2, train2);

    var train3 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(3, train3);

    var train4 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(4, train4);

    var train5 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(5, train5);

    var train6 = TrainModel()
      ..title = ''
      ..type = ''
      ..group = 0
      ..time = 0;
    Boxes.getTrain().put(6, train6);

    _loadTrains();
  }

  void changeCurrentDay(int newDay) {
    currentDayIndex = newDay;

    switch (newDay) {
      case 1:
        currentDayName = 'Segunda-feira';
        train = Boxes.getTrain().toMap()[1];

        break;
      case 2:
        currentDayName = 'Terça-feira';
        train = Boxes.getTrain().toMap()[2];

        break;
      case 3:
        currentDayName = 'Quarta-feira';
        train = Boxes.getTrain().toMap()[3];

        break;
      case 4:
        currentDayName = 'Quinta-feira';
        train = Boxes.getTrain().toMap()[4];

        break;
      case 5:
        currentDayName = 'Sexta-feira';
        train = Boxes.getTrain().toMap()[5];

        break;
      case 6:
        currentDayName = 'Sábado';
        train = Boxes.getTrain().toMap()[6];

        break;
      default:
        currentDayName = 'Domingo';
        train = Boxes.getTrain().toMap()[0];

        break;
    }

    update();
  }
}
