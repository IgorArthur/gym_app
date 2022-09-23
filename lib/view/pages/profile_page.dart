import 'package:gym_app/exports.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
            _photo(context, profileController),
            _content(profileController),
          ],
        );
      },
    );
  }

  Widget _photo(
    BuildContext context,
    ProfileController profileController,
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
              Navigator.of(context).pop();
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: TextButton(
            onPressed: () {
              
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 48.w,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.neutral100,
                    borderRadius: BorderRadius.circular(24.w),
                  ),
                  child: Icon(
                    Icons.face,
                    size: 32.w,
                    color: AppColors.neutral200,
                  ),
                ),
                Container(
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.neutral0,
                    border: Border.all(color: AppColors.neutral200),
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: AppColors.neutral200,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _content(ProfileController profileController) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFieldCustom(
            height: 5.h,
            width: 70.w,
            controller: profileController.nameController,
            label: 'Nome',
            onChanged: (String value) {
              profileController.update();
            },
            contentPadding: EdgeInsets.only(
              top: 8.h,
              right: 4.w,
              left: 4.w,
            ),
          ),
          TextFieldCustom(
            height: 5.h,
            width: 70.w,
            controller: profileController.ageController,
            label: 'Idade',
            onChanged: (String value) {
              profileController.update();
            },
            contentPadding: EdgeInsets.only(
              top: 8.h,
              right: 4.w,
              left: 4.w,
            ),
          ),
          TextFieldCustom(
            height: 5.h,
            width: 70.w,
            controller: profileController.weightController,
            label: 'Peso',
            onChanged: (String value) {
              profileController.update();
            },
            contentPadding: EdgeInsets.only(
              top: 8.h,
              right: 4.w,
              left: 4.w,
            ),
          ),
          TextFieldCustom(
            height: 5.h,
            width: 70.w,
            controller: profileController.heightController,
            label: 'Altura',
            onChanged: (String value) {
              profileController.update();
            },
            contentPadding: EdgeInsets.only(
              top: 8.h,
              right: 4.w,
              left: 4.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/edit_train_page');
                },
                child: Container(
                  height: 5.h,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  decoration: const BoxDecoration(
                    color: AppColors.softBlue,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Text('Editar treinos').header(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
