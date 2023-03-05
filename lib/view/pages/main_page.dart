import 'package:gym_app/exports.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Sizer(
            builder: (context, orientation, deviceType) {
              return _handleBody(context);
            },
          ),
        ),
      ),
    );
  }

  Widget _handleBody(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (mainController) {
        return GetBuilder<TrainController>(builder: (trainController) {
          return Column(
            children: [
              _header(
                mainController,
                trainController,
                context,
              ),
              _content(
                mainController,
                trainController,
              ),
            ],
          );
        });
      },
    );
  }

  Widget _header(
    MainController mainController,
    TrainController trainController,
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
              Calendar(
                mainController: mainController,
                trainController: trainController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content(
    MainController mainController,
    TrainController trainController,
  ) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: Text('Treino de ${mainController.currentDayName}').subtitle(),
        ),
        trainController.exerciseList.isEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: const Text('Nenhum treino cadastrado para hoje.')
                    .header(AppColors.neutral100),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                height: 30.h,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 2.h),
                  child: MainTile(
                    width: 85.w,
                    height: 16.h,
                    colorIndex: 0,
                    icon: mainController.train!.title == 'Aquecimento'
                        ? Icons.directions_bike
                        : Icons.fitness_center,
                    iconColor: AppColors.neutral200,
                    iconSize: 85,
                    time: mainController.train!.time,
                    title: mainController.train!.title,
                    clickable: mainController.train!.title == 'Aquecimento'
                        ? false
                        : true,
                    onTap: () {
                      trainController
                        ..train = mainController.train!
                        ..update();
                    },
                  ),
                ),
              ),
      ],
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
        return GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (profileController) {
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
                            child: Text(
                                    'Nome: ${profileController.nameController.text}')
                                .subtitle(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                            child: Text(
                                    'Idade: ${profileController.ageController.text} anos')
                                .subtitle(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                            child: Text(
                                    'Peso: ${profileController.weightController.text} kg')
                                .subtitle(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, bottom: 1.h),
                            child: Text(
                                    'Altura: ${profileController.heightController.text} m')
                                .subtitle(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/profile_page');
                                },
                                child: Container(
                                  height: 5.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: const BoxDecoration(
                                    color: AppColors.orange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  width: 45.w,
                                  alignment: Alignment.center,
                                  child: const Text('Editar perfil').header(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            });
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }
}
