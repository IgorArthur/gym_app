import 'package:flutter/material.dart';
import 'package:gym_app/view/utils/export_utils.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    Key? key,
    required this.width,
    required this.height,
    required this.colorIndex,
    required this.icon,
    required this.iconColor,
    required this.iconSize,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.clickable,
    this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final int colorIndex;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final int time;
  final String title;
  final String subtitle;
  final bool clickable;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
        
        clickable ? Navigator.of(context).pushNamed('/train_page') : null;
      },
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.symmetric(
          vertical: (0.1 * height),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: (0.1 * width),
          vertical: (0.14 * height),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: _getPrimaryColor(colorIndex),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title).subtitle(),
                Padding(
                  padding: EdgeInsets.only(
                    top: (0.04 * height),
                    bottom: (0.1 * height),
                  ),
                  child: Text(subtitle).body2(
                    _getSecondaryColor(colorIndex),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: (0.025 * width),
                  ),
                  height: 0.23 * height,
                  width: 0.32 * width,
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
                        child: Text('$time min').body2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            )
          ],
        ),
      ),
    );
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
