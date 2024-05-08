import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'app_setting.g.dart';

@Collection()
class AppSettings {
  Id id = Isar.autoIncrement;
  DateTime? firstLounchDate;
}
