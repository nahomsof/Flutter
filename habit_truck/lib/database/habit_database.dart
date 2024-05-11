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
    final habit = await isar.habits.get(id);

    //update complition status

    if (habit != null) {
      await isar.writeTxn(() async {
        //if habit is compeleted -> add the current data to the completedDAy list
        if (iscompleted && !habit.completedDays.contains(DateTime.now())) {
          final today = DateTime.now();
          //add teh currentdate if it is not already in the list
          habit.completedDays.add(DateTime(today.year, today.month, today.day));
        }
        //if habit is NOT completed -> remove the current data from the list
        else {
          //remove the current data if the habit is marked as not completed.
          habit.completedDays.removeWhere((date) =>
              date.year == DateTime.now().year &&
              date.month == DateTime.now().month &&
              date.day == DateTime.now().day);
        }
        await isar.habits.put(habit);
      });
    }
    //re-read from db
    readHabits();
  }

  Future<void> updateHabitname(int id, String newName) async {
    //find the specific habit
    final habit = await isar.habits.get(id);
    //find the specific habit
    if (habit != null) {
      //update name
      await isar.writeTxn(() async {
        await isar.habits.put(habit);
      });
      readHabits();
    }
  }

  Future<void> deleteHabit(int id) async {
    //perform the delete
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });
    //re-read from the database
    readHabits();
  }
}
