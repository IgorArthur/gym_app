import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/controller/main_controller.dart';
import 'package:gym_app/controller/train_controller.dart';
import 'package:gym_app/view/utils/export_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return _handleBody();
          },
        ),
      ),
    );
  }

  Widget _handleBody() {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (mainController) {
        return Column(
          children: [
            _header(mainController),
            _content(mainController),
          ],
        );
      },
    );
  }

  Widget _header(MainController mainController) {
    return Column(
      children: [
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
        SizedBox(
          height: 18.3.h,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 8.w, bottom: 3.3.h),
                alignment: Alignment.centerLeft,
                child: const Text('Olá, Igor').title(),
              ),
              Calendar(currentDay: mainController.currentDay),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content(MainController mainController) {
    return GetBuilder<TrainController>(
      init: TrainController(),
      builder: (trainController) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: const Text('Treino de hoje').subtitle(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              height: 60.h,
              child: ListView.builder(
                itemCount: mainController.trainList.length,
                itemBuilder: (BuildContext context, int index) {
                  return MainTile(
                    width: 85.w,
                    height: 16.h,
                    colorIndex: index % 5,
                    icon: mainController.trainList[index].title == 'Aquecimento'
                        ? Icons.directions_bike
                        : Icons.fitness_center,
                    iconColor: AppColors.neutral200,
                    iconSize: 85,
                    time: mainController.trainList[index].time,
                    title: mainController.trainList[index].title,
                    subtitle: mainController.trainList[index].type,
                    clickable:
                        mainController.trainList[index].title == 'Aquecimento'
                            ? false
                            : true,
                    onTap: () {
                      trainController
                        ..train = mainController.trainList[index]
                        ..update();
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
