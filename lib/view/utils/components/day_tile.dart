import 'package:gym_app/exports.dart';

class DayTile extends StatelessWidget {
  const DayTile({
    Key? key,
    required this.width,
    required this.height,
    required this.colorIndex,
    required this.day,
  }) : super(key: key);

  final double width;
  final double height;
  final int colorIndex;
  final String day;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      onPressed: () {
        Get.find<TrainController>()
          ..dayName = day.removeAllWhitespace
          ..update();

        Navigator.of(context).pushNamed('/edit_day_page');
      },
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
          vertical: (0.1 * height),
        ),
        padding: EdgeInsets.only(
          right: (0.01 * width),
          left: (0.01 * width),
          bottom: (0.14 * height),
          top: (0.14 * height),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getPrimaryColor(colorIndex),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                alignment: Alignment.center,
                width: 0.70 * width,
                child: Text(
                  day,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ).header()),
            Icon(
              Icons.calendar_month,
              size: 0.3 * width,
              color: AppColors.neutral200,
            ),
          ],
        ),
      ),
    );
  }

  Color _getPrimaryColor(int colorIndex) {
    switch (colorIndex) {
      case 0:
        return AppColors.orange;
      case 1:
        return AppColors.softRed;
      case 2:
        return AppColors.softGreen;
      case 3:
        return AppColors.softPurple;
      default:
        return AppColors.softYellow;
    }
  }
}
