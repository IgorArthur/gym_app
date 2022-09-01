import 'package:flutter/material.dart';
import 'package:gym_app/view/utils/export_utils.dart';
import 'package:sizer/sizer.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
    required this.currentDay,
  }) : super(key: key);

  final int currentDay;

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
                _dayTile(true, false, 'D'),
                _dayTile(false, false, 'S'),
                _dayTile(false, false, 'T'),
                _dayTile(false, false, 'Q'),
                _dayTile(false, false, 'Q'),
                _dayTile(false, false, 'S'),
                _dayTile(false, true, 'S'),
              ],
            ),
          ),
          SizedBox(
            height: 3.1.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayCheck(0, currentDay),
                _dayCheck(1, currentDay),
                _dayCheck(2, currentDay),
                _dayCheck(3, currentDay),
                _dayCheck(4, currentDay),
                _dayCheck(5, currentDay),
                _dayCheck(6, currentDay),
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
      child: Text(title).subtitle(),
    );
  }

//   Widget _dayCheck(int state) {
//     return Container(
//       alignment: Alignment.center,
//       width: 12.w,
//       child: state == 0
//           ? Icon(
//               Icons.close,
//               size: 3.5.w,
//               color: AppColors.error100,
//             )
//           : state == 1
//               ? Container(
//                   height: 2.1.w,
//                   width: 2.1.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(1.05.w),
//                     color: AppColors.sucess100,
//                   ),
//                 )
//               : state == 2
//                   ? Container(
//                       height: 2.1.w,
//                       width: 2.1.w,
//                       decoration: BoxDecoration(
//                         border:
//                             Border.all(color: AppColors.hardBlue, width: 1.5),
//                         borderRadius: BorderRadius.circular(1.05.w),
//                       ),
//                     )
//                   : const SizedBox(),
//     );
//   }
// }

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
}
