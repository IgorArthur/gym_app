import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/controller/train_controller.dart';
import 'package:gym_app/view/utils/export_utils.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            _photo(context, trainController),
            _content(trainController),
          ],
        );
      },
    );
  }

  Widget _photo(
    BuildContext context,
    TrainController trainController,
  ) {
    return Container(
      alignment: Alignment.center,
      height: 36.w,
      width: 36.w,
      decoration: BoxDecoration(
        color: AppColors.neutral100,
        borderRadius: BorderRadius.circular(18.w),
      ),
      child: Icon(
        Icons.face,
        size: 24.w,
        color: AppColors.neutral200,
      ),
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
