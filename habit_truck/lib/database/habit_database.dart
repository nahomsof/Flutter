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
}
//save first date of app starup (for heatmap)

