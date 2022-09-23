import 'package:gym_app/exports.dart';

class EditTrainPage extends StatefulWidget {
  const EditTrainPage({Key? key}) : super(key: key);

  @override
  State<EditTrainPage> createState() => _EditTrainPageState();
}

class _EditTrainPageState extends State<EditTrainPage> {
  @override
  void dispose() {
    super.dispose();

    Get.find<ProfileController>().putInfo();
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
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _header(profileController, context),
            _content(profileController),
          ],
        );
      },
    );
  }

  Widget _header(
    ProfileController profileController,
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          height: 12.7.h,
          alignment: Alignment.centerLeft,
          child: 
            TextButton(
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
                    Navigator.of(context).pop();
                  },
                ),
          
        ),
        Container(
          padding: EdgeInsets.only(left: 8.w, bottom: 3.3.h,),
          alignment: Alignment.centerLeft,
          child: const Text('Editar treinos').title(),
        ),
      ],
    );
  }

  Widget _content(ProfileController profileController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Domingo',
              ),
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Segunda-feira',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Terça-feira',
              ),
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Quarta-feira',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Quinta-feira',
              ),
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Sexta-feira',
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayTile(
                width: 35.w,
                height: 15.h,
                colorIndex: 0,
                day: 'Sábado',
              ),
            ],
          )
        ],
      ),
    );
  }
}
