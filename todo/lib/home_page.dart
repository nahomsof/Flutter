import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database.dart';
import 'package:todo/dialog_box.dart';
import 'package:todo/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive
  final _myBox = Hive.box('mybox');
  final _controller = TextEditingController();
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    super.initState();
    //if this is the 1st time ever openin the app,then creat defalut dat
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void creatnewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            onSave: saveNewTask,
            controller: _controller,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: creatnewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskCompleted: db.toDoList[index][1],
              taskName: db.toDoList[index][0],
              onChanged: ((value) => checkboxchanged(value, index)),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
    );
  }
}
