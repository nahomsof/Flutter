import 'package:todo/domain/model/todo.dart';

abstract class TodoRepo {
//get list of tools
  Future<List<Todo>> getTools();
// add a new todo
  Future<void> addTodo(Todo newTodo);
  //update existed todo
  Future<void> updateTodo(Todo todo);
  //delete a todo
  Future<void> deleteTodo(Todo todo);
}
