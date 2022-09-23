import 'package:gym_app/exports.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<ProfileModel>('profile');
  Hive.registerAdapter(TrainModelAdapter());
  await Hive.openBox<TrainModel>('train');
  Hive.registerAdapter(ExerciseModelAdapter());
  await Hive.openBox<List<dynamic>>('exercises');

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
        '/edit_train_page': (context) => const EditTrainPage(),
        '/edit_day_page': (context) => const EditDayPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/register_page': (context) => const ProfilePage(),
      },
    );
  }
}
