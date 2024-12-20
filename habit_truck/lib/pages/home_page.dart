import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habit_truck/component/drawer.dart';
import 'package:habit_truck/component/my_habit_tile.dart';
import 'package:habit_truck/component/my_heat_map.dart';
import 'package:habit_truck/database/habit_database.dart';
import 'package:habit_truck/models/habit.dart';
import 'package:habit_truck/util/habit_util.dart';

import 'package:provider/provider.dart';

import '../database/habit_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    //read existing habits on app
    Provider.of<HabitDatabase>(context, listen: false).readHabits();
    super.initState();
  }

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
                MaterialButton(
                  onPressed: () {
                    String newhabitname = textController.text;
                    //save to db
                    context.read<HabitDatabase>().addHabit(newhabitname);
                    //pop box
                    Navigator.pop(context);
                    //clear controller
                    textController.clear();
                  },
                  child: const Text('Save'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //clear contorller
                    textController.clear();
                  },
                  child: const Text('Cancel'),
                )
              ],
            ));
  }

  void checkhabitonoff(bool? value, Habit habit) {
    //update habit compilation states
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  //edit habit
  void editHabitBox(Habit habit) {
    //set the controller's text to the habit current name
    textController.text = habit.name;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                //save button
                MaterialButton(
                  onPressed: () {
                    String newhabitname = textController.text;
                    //save to db
                    context
                        .read<HabitDatabase>()
                        .updateHabitname(habit.id, newhabitname);
                    //pop box
                    Navigator.pop(context);
                    //clear controller
                    textController.clear();
                  },
                  child: const Text('Save'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //clear contorller
                    textController.clear();
                  },
                  child: const Text('Cancel'),
                )

                //cancel button
              ],
            ));
  }

  //delete habit
  void deleteHabitBox(Habit habit) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Are you sure you want to delete"),
              actions: [
                //save button
                MaterialButton(
                  onPressed: () {
                    //save to db
                    context.read<HabitDatabase>().deleteHabit(habit.id);
                    //pop box
                    Navigator.pop(context);
                    //clear controller
                  },
                  child: const Text('Delete'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                )

                //cancel button
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createnewhabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: ListView(
        children: [
          // HEAT MAP
          _buildHeatMap(),
          //HABITLIST
          _buildhabitlist(),
        ],
      ),
    );
  }

  //BUILD heat MAP
  Widget _buildHeatMap() {
    final habitDatabase = context.watch<HabitDatabase>();
    //current habit
    List<Habit> currentHabit = habitDatabase.currentHabit;
    //return habit list
    return FutureBuilder<DateTime?>(
        future: HabitDatabase.getFirstLaunchDate(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MyHeatMap(
                startDate: snapshot.data!,
                datasets: prepHeatMapDataset(currentHabit));
          } else {
            return Container();
          }
        });
  }

  Widget _buildhabitlist() {
    final habitdatabase = context.watch<HabitDatabase>();
    List<Habit> currentHabit = habitdatabase.currentHabit;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: currentHabit.length,
        itemBuilder: (context, index) {
          final habit = currentHabit[index];
          bool iscompletedToday = isHabitComplitedToday(habit.completedDays);
          return MyHabitTile(
            inComplite: iscompletedToday,
            text: habit.name,
            onChanged: (value) => checkhabitonoff(value, habit),
            edithabit: (context) => editHabitBox(habit),
            deleteHabit: (context) => deleteHabitBox(habit),
          );
        });
  }
}
