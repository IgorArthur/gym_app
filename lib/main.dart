import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_app/controller/main_controller.dart';
import 'package:gym_app/controller/profile_controller.dart';
import 'package:gym_app/model/profile_model.dart';
import 'package:gym_app/model/train_model.dart';
import 'package:gym_app/view/pages/hello_page.dart';
import 'package:gym_app/view/pages/profile_page.dart';
import 'package:gym_app/view/pages/train_page.dart';
import 'package:gym_app/view/utils/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<ProfileModel>('profile');
  Hive.registerAdapter(TrainModelAdapter());
  await Hive.openBox<TrainModel>('train');

  Get.put(MainController());
  Get.put(ProfileController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const HelloPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HelloPage(),
        '/train_page': (context) => const TrainPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/register_page': (context) => const ProfilePage(),
      },
    );
  }
}
