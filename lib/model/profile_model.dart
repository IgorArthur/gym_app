import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 0)
class ProfileModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int age;

  @HiveField(2)
  late double weight;

  @HiveField(3)
  late double height;

  bool? initialized;
}
