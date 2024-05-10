import 'package:flutter/material.dart';
import 'package:habit_truck/models/app_setting.dart';
import 'package:habit_truck/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;
// Initialization - Database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar =
        await Isar.open([HabitSchema, AppSettingsSchema], directory: dir.path);
  }

//save first date of app starup (for heatmap)
  static Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = AppSettings()..firstLounchDate = DateTime.now();
      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  //Get first date of app statup (for heatmap)
  static Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLounchDate;
  }

  //List of habits
  final List<Habit> currentHabit = [];
  //Create add new habit
  Future<void> addHabit(String habitname) async {
    //create a new habit

    final newHabit = Habit()..name = habitname;

    //save to db

    await isar.writeTxn(() => isar.habits.put(newHabit));
    //re-read from db
    readHabits();
  }

  Future<void> readHabits() async {
    List<Habit> fetchedHabits = await isar.habits.where().findAll();

    //give to current habits

    currentHabit.clear();
    currentHabit.addAll(fetchedHabits);
    //update UI
    notifyListeners();
  }

//UPDATE - check habit on and off
  Future<void> updateHabitCompletion(int id, bool iscompleted) async {
    //find the specific habit
    //update complition status
  }
//update - edit habit name
//DELETE - delete habit
}
