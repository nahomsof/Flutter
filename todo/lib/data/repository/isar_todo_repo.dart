import 'package:isar/isar.dart';
import 'package:todo/data/model/isar_todo.dart';
import 'package:todo/domain/model/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  //get todos
  Future<List<Todo>> getTodo() async {
    //featch from the database

    // return as a list of todos and give to domain layer
    final todos = await db.todoIsars.where().findAll();

    //return as a list of todos and give a domain layer

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }
  //add todos
  @override
  Future<void> addTodo(Todo newTodo) {
   // covert todo to isar todo
    final todoisar = TodoIsar.fromDomain(newTodo);
   //so we can store it in isar
   return db.writeTxn(() => db.todoIsars.put(todoisar));
  }
  //update todos
 @override
  Future<void> updateTodo(Todo todo) {
   // covert todo to isar todo
    final todoisar = TodoIsar.fromDomain(todo);
   //so we can store it in isar
   return db.writeTxn(() => db.todoIsars.put(todoisar));
  }
  //delete todos
  @override
  Future<void> deleteTodo(Todo todo) {
    
  
   return db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
  
  @override
  Future<List<Todo>> getTools() {
    // TODO: implement getTools
    throw UnimplementedError();
  }
}
