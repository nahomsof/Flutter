import 'package:isar/isar.dart';
import 'package:todo/domain/model/todo.dart';

part 'isar_todo.g.dart';
@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  //cover pure todo object -> isar Object to stor in isr db
  static TodoIsar fromDomain(Todo todo){
    return TodoIsar()
    ..id = todo.id
    ..text = todo.text
    ..isCompleted = todo.isCompleted;
  }
}
