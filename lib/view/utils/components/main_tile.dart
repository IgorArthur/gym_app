import 'package:gym_app/export.dart';

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
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      onPressed: () {
        onTap?.call();

        clickable ? Navigator.of(context).pushNamed('/train_page') : null;
      },
      child: Container(
        width: width,
        height: height,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 0.5 * width,
                  child: Text(title).subtitle(),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 0.07 * height),
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
                        color: AppColors.neutral200,
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
}
