import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //Lodad
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTools();

    emit(todoList);
  }

  // Add Todo
  Future<void> addTodo(String text) async {
    //creat a new todo
    final newTodo = Todo(id: DateTime.now().microsecondsSinceEpoch, text: text);

    // save the new todo to repo
    await todoRepo.addTodo(newTodo);

    // re-load
    loadTodos();
  }

  Future<void> deleteTodo(Todo todo) async {
    // delete the provided todo from the repo
    await todoRepo.deleteTodo(todo);

    // reload
    loadTodos();
  }

  Future<void> toggleCompletion(Todo todo) async {
    final updateTodo = todo.toggleCompletion();

    //update the todo in repo with new completion status
    await todoRepo.updateTodo(todo);

    // reload
    loadTodos();
  }
}
