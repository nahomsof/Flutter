import 'package:isar/isar.dart';

part 'habit.g.dart';

@Collection()
class Habit {
  //habit id
  Id id = Isar.autoIncrement;

  //habit name
  late String name;

  //completed day
  List<DateTime> completedDays = [
    //DateTime(year, month, day)
  ];
}
