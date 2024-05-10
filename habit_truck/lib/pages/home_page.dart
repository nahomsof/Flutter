import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_truck/component/drawer.dart';
import 'package:habit_truck/database/habit_database.dart';
import 'package:habit_truck/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text conroller
  final TextEditingController textController = TextEditingController();
  //create new habit
  void createnewhabit() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
                decoration: InputDecoration(hintText: "Creat a new habit"),
              ),
              actions: [
                MaterialButton(onPressed: () {
                  String newhabitname = textController.text;
                  //save to db
                  context.read<HabitDatabase>().addHabit(newhabitname);
                  //pop box
                  Navigator.pop(context);
                  //clear controller
                  textController.clear();
                })
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewhabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.add),
      ),
    );
  }
}
