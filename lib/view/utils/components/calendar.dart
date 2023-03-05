import 'package:gym_app/exports.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.mainController,
    required this.trainController,
  }) : super(key: key);

  final MainController mainController;
  final TrainController trainController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 11.7.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 7.6.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayTile(true, false, 'D', 0),
                _dayTile(false, false, 'S', 1),
                _dayTile(false, false, 'T', 2),
                _dayTile(false, false, 'Q', 3),
                _dayTile(false, false, 'Q', 4),
                _dayTile(false, false, 'S', 5),
                _dayTile(false, true, 'S', 6),
              ],
            ),
          ),
          SizedBox(
            height: 3.1.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayCheck(0, mainController.currentDayIndex),
                _dayCheck(1, mainController.currentDayIndex),
                _dayCheck(2, mainController.currentDayIndex),
                _dayCheck(3, mainController.currentDayIndex),
                _dayCheck(4, mainController.currentDayIndex),
                _dayCheck(5, mainController.currentDayIndex),
                _dayCheck(6, mainController.currentDayIndex),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _dayTile(
    bool isStart,
    bool isFinal,
    String title,
    int index,
  ) {
    return Container(
      alignment: Alignment.center,
      width: 12.w,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral200),
        borderRadius: isStart
            ? const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
            : isFinal
                ? const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )
                : null,
      ),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        ),
        onPressed: () {
          mainController.changeCurrentDay(index);

          _getInfo(index);
        },
        child: Text(title).subtitle(),
      ),
    );
  }

  Widget _dayCheck(int index, int currentDay) {
    return Container(
      alignment: Alignment.center,
      width: 12.w,
      child: index == currentDay
          ? Container(
              height: 2.1.w,
              width: 2.1.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.hardBlue, width: 1.5),
                borderRadius: BorderRadius.circular(1.05.w),
              ),
            )
          : const SizedBox(),
    );
  }

  String _getDayByIndex(int index) {
    switch (index) {
      case 1:
        return 'Segunda-feira';
      case 2:
        return 'Terça-feira';
      case 3:
        return 'Quarta-feira';
      case 4:
        return 'Quinta-feira';
      case 5:
        return 'Sexta-feira';
      case 6:
        return 'Sábado';
      default:
        return 'Domingo';
    }
  }

  void _getInfo(int index) {
    trainController
      ..dayName = _getDayByIndex(index)
      ..update();

    if (Boxes.getExercises().get(index) == null) {
      trainController.createExercises();
    } else {
      trainController.loadExercises();
    }
  }
}
