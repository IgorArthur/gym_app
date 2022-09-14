import 'package:flutter/material.dart';
import 'package:gym_app/view/utils/export_utils.dart';

class TrainTile extends StatelessWidget {
  const TrainTile({
    Key? key,
    required this.width,
    required this.height,
    required this.colorIndex,
    required this.title,
    required this.weight,
    required this.sets,
    required this.reps,
  }) : super(key: key);

  final double width;
  final double height;
  final int colorIndex;
  final String title;
  final double weight;
  final int sets;
  final int reps;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
          vertical: (0.1 * height),
        ),
        padding: EdgeInsets.only(
          right: (0.03 * width),
          left: (0.05 * width),
          bottom: (0.14 * height),
          top: (0.14 * height),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getPrimaryColor(colorIndex),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 0.45 * width,
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ).header()),
            SizedBox(
                width: 0.2 * width,
                child:
                    Text('$weight kg', 
                  overflow: TextOverflow.ellipsis,).body2(_getSecondaryColor(colorIndex))),
            SizedBox(
              width: 0.25 * width,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: (0.025 * width),
                ),
                height: 0.60 * height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 0.057 * width,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 0.025 * width),
                      child: Text('$sets x $reps').body2(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

Color _getPrimaryColor(int colorIndex) {
    switch (colorIndex) {
      case 0:
        return AppColors.softBlue;
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

  Color _getSecondaryColor(int colorIndex) {
    switch (colorIndex) {
      case 0:
        return AppColors.hardBlue;
      case 1:
        return AppColors.hardRed;
      case 2:
        return AppColors.hardGreen;
      case 3:
        return AppColors.hardPurple;
      default:
        return AppColors.hardYellow;
    }
  }
}
