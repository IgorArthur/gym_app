import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/controller/train_controller.dart';
import 'package:gym_app/view/utils/export_utils.dart';
import 'package:sizer/sizer.dart';

class TrainPage extends StatelessWidget {
  const TrainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return _handleBody(context);
          },
        ),
      ),
    );
  }

  Widget _handleBody(BuildContext context) {
    return GetBuilder<TrainController>(
      init: TrainController(),
      builder: (trainController) {
        return Column(
          children: [
            _header(context, trainController),
            _content(trainController),
          ],
        );
      },
    );
  }

  Widget _header(
    BuildContext context,
    TrainController trainController,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: const Icon(Icons.arrow_back_ios),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Container(
              height: 12.7.h,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: Container(
                  alignment: Alignment.center,
                  height: 12.w,
                  width: 12.w,
                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.circular(6.w),
                  ),
                  child: Icon(
                    Icons.face,
                    size: 8.w,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(left: 8.w, bottom: 5.6.h),
          alignment: Alignment.centerLeft,
          child: Text(trainController.train.title).title(),
        ),
      ],
    );
  }

  Widget _content(TrainController trainController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      height: 78.h,
      child: ListView.builder(
          itemCount: trainController.train.exerciseList.length,
          itemBuilder: (BuildContext context, int index) {
            return TrainTile(
              width: 84.w,
              height: 8.h,
              colorIndex: trainController.train.exerciseList[index].group % 5,
              title: trainController.train.exerciseList[index].title,
              weight: trainController.train.exerciseList[index].weight,
              sets: trainController.train.exerciseList[index].sets,
              reps: trainController.train.exerciseList[index].reps,
            );
          }),
    );
  }
}
