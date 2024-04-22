import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  // reference our box
  List toDoList = [];
  final _mybox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ['MAKE TODO LIST', false],
      ['Do Excercise', false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get('TODOLIST');
  }

  void updateDataBase() {
    _mybox.put('TODOLIST', toDoList);
  }
}
