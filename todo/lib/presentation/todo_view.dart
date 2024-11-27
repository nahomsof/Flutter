import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel")),
                TextButton(
                  onPressed: () {
                    todoCubit.addTodo(textController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text("Add"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final todoCubuit = context.read<TodoCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoBox,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.text),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) => todoCubuit.toggleCompletion(todo),
                ),
                trailing: IconButton(
                    onPressed: () => todoCubuit.deleteTodo(todo),
                    icon: const Icon(Icons.delete)),
              );
            },
          );
        },
      ),
    );
  }
}