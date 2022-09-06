import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/controller/main_controller.dart';
import 'package:gym_app/controller/train_controller.dart';
import 'package:gym_app/view/utils/export_utils.dart';
import 'package:sizer/sizer.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType) {
          return _handleBody(context);
        },
      ),
    );
  }

  Widget _handleBody(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (mainController) {
        return Column(
          children: [
            _header(
              mainController,
              context,
            ),
            _content(mainController),
          ],
        );
      },
    );
  }

  Widget _header(
    MainController mainController,
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5.h),
          height: 12.7.h,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: TextButton(
              onPressed: () async {
                _showAlert();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
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
                  color: AppColors.neutral200,
                ),
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
              Calendar(controller: mainController),
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
              padding: EdgeInsets.only(top: 2.h),
              child:
                  Text('Treino de ${mainController.currentDayName}').subtitle(),
            ),
            mainController.trainList.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: const Text('Nenhum treino cadastrado para hoje.')
                        .header(AppColors.neutral100),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    height: 57.h,
                    child: ListView.builder(
                      itemCount: mainController.trainList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: MainTile(
                            width: 85.w,
                            height: 16.h,
                            colorIndex: mainController.trainList[index].group,
                            icon: mainController.trainList[index].title ==
                                    'Aquecimento'
                                ? Icons.directions_bike
                                : Icons.fitness_center,
                            iconColor: AppColors.neutral200,
                            iconSize: 85,
                            time: mainController.trainList[index].time,
                            title: mainController.trainList[index].title,
                            subtitle: mainController.trainList[index].type,
                            clickable: mainController.trainList[index].title ==
                                    'Aquecimento'
                                ? false
                                : true,
                            onTap: () {
                              trainController
                                ..train = mainController.trainList[index]
                                ..update();
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ],
        );
      },
    );
  }

  _showAlert() {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(context).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, _, __) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.neutral0,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              width: 100.w,
              height: 60.h,
              child: Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5.h),
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
                            color: AppColors.neutral200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 3.3.h),
                      child: const Text('Meu perfil').title(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                      child: const Text('Nome: Igor Arthur').subtitle(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                      child: const Text('Idade: 19 anos').subtitle(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                      child: const Text('Peso: 67 kg').subtitle(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                      child: const Text('Altura: 1.80 m').subtitle(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.h),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.neutral200),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: const Text(
                              'Editar perfil'
                            ).header(),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.neutral200),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Text(
                            'Cadastrar treino'
                          ).header(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }
}
