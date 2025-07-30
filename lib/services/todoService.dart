import 'package:crudflutter/models/todo.dart';
import 'package:hive_ce/hive.dart';

class TodoService {
  static final TodoService _singleton = TodoService._internal();
  factory TodoService() {
    return _singleton;
  }
  TodoService._internal();

  final Box<Todo> _todoBox = Hive.box<Todo>('TODOS');

  Future<void> addTodo(Todo todo) async {
    await _todoBox.add(todo);
  }
  Future<void> updateTodo(int index, Todo todo) async {
    await _todoBox.putAt(index, todo);
  }
  Future<void> deleteTodo(int index) async {
    await _todoBox.deleteAt(index);
  }
  List<Todo> getTodos() {
    return _todoBox.values.toList();
  }
}