import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo/data/model/isar_todo.dart';
import 'package:todo/data/repository/isar_todo_repo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:todo/presentation/todo_page.dart';
import 'package:todo/presentation/todo_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get the dirctory path form the storing data

  final dir = await getApplicationDocumentsDirectory();
  //open isar data base
  final isar = await Isar.open(
    [TodoIsarSchema],
    directory: dir.path,
  );

//initilize the repo with isar database

  final isartodrepo = IsarTodoRepo(isar);
  runApp(MyApp(
    todoRepo: isartodrepo,
  ));
}

class MyApp extends StatelessWidget {
  //Database injection threough the app
  final TodoRepo todoRepo;
  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: TodoPage(todoRepo: todoRepo));
  }
}
