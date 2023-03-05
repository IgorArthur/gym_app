import 'package:gym_app/exports.dart';

class EditDayPage extends StatefulWidget {
  const EditDayPage({Key? key}) : super(key: key);

  @override
  State<EditDayPage> createState() => _EditDayPageState();
}

class _EditDayPageState extends State<EditDayPage> {
  @override
  void initState() {
    super.initState();

    _getInfo();
  }

  void _getInfo() {
    final controller = Get.find<TrainController>();
    controller.getinfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return _handleBody(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _handleBody(BuildContext context) {
    return GetBuilder<TrainController>(
      init: TrainController(),
      builder: (trainController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _header(trainController, context),
            _content(trainController),
          ],
        );
      },
    );
  }

  Widget _header(
    TrainController trainController,
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          height: 12.7.h,
          alignment: Alignment.centerLeft,
          child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.neutral200,
              ),
            ),
            onPressed: () {
              Get.find<MainController>().loadInfo();
              _getInfo();
              
              Navigator.of(context).pop();
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            left: 8.w,
            bottom: 3.3.h,
          ),
          alignment: Alignment.centerLeft,
          child: Text('Editando treino de ${trainController.dayName}').title(),
        ),
      ],
    );
  }

  Widget _content(TrainController trainController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: trainController.exerciseList.length * 9.6.h,
          child: ListView.builder(
            itemCount: trainController.exerciseList.length,
            itemBuilder: (BuildContext context, int index) {
              return TrainTile(
                width: 84.w,
                height: 7.h,
                colorIndex: 0,
                title: trainController.exerciseList[index].title,
                weight: trainController.exerciseList[index].weight,
                sets: trainController.exerciseList[index].sets,
                reps: trainController.exerciseList[index].reps,
                hasDelete: true,
                onClickDelete: () {
                  trainController.removeExercise(index);
                },
              );
            },
          ),
        ),
        TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.only(top: 2.h)),
          ),
          onPressed: () {
            _showAddExerciseDialog(trainController);
          },
          child: Container(
            height: 5.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            margin: EdgeInsets.only(right: 5.w),
            decoration: const BoxDecoration(
              color: AppColors.sucess100,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.neutral0,
                  size: 2.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.w),
                  child: const Text('Exercício').header(AppColors.neutral0),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> _showAddExerciseDialog(TrainController trainController) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Adicionar exercício').title(),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldCustom(
                  height: 5.h,
                  width: 70.w,
                  controller: trainController.nameController,
                  label: 'Nome',
                  onChanged: (String value) {},
                  contentPadding: EdgeInsets.only(
                    top: 8.h,
                    right: 4.w,
                    left: 4.w,
                  ),
                ),
                DropDownCustom(
                  height: 5.h,
                  width: 70.w,
                  label: 'Grupo',
                  valueSelect: trainController.groupNotifier,
                  values: const [
                    'Selecionar',
                    'Abdômem',
                    'Bíceps',
                    'Costas',
                    'Glúteos',
                    'Ombros',
                    'Peito',
                    'Posterior',
                    'Quadríceps',
                    'Tríceps',
                  ],
                  onChanged: (String value) {},
                  contentPadding: EdgeInsets.only(
                    top: 2.h,
                    bottom: 1.h,
                    right: 2.w,
                    left: 4.w,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFieldCustom(
                      height: 5.h,
                      width: 32.w,
                      controller: trainController.setsController,
                      label: 'Séries',
                      onChanged: (String value) {},
                      contentPadding: EdgeInsets.only(
                        top: 8.h,
                        right: 4.w,
                        left: 4.w,
                      ),
                    ),
                    TextFieldCustom(
                      height: 5.h,
                      width: 32.w,
                      controller: trainController.repsController,
                      label: 'Repetições',
                      onChanged: (String value) {},
                      contentPadding: EdgeInsets.only(
                        top: 8.h,
                        right: 4.w,
                        left: 4.w,
                      ),
                    ),
                  ],
                ),
                TextFieldCustom(
                  height: 5.h,
                  width: 70.w,
                  controller: trainController.weightController,
                  label: 'Peso',
                  onChanged: (String value) {},
                  contentPadding: EdgeInsets.only(
                    top: 8.h,
                    right: 4.w,
                    left: 4.w,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  trainController.addExercise();

                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 5.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  decoration: const BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Text('Confirmar').header(),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
