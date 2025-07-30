import 'package:hive_ce_flutter/adapters.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String title;
  
  @HiveField(2)
  String description;
  
  @HiveField(3)
  bool isCompleted;
  
  @HiveField(4)
  DateTime? createdAt;

  Todo({this.id, required this.title, required this.description, this.isCompleted = false, this.createdAt}) {
    if(id == null || id!.isEmpty){
      id = DateTime.now().toString();
    }
    createdAt = DateTime.now();
  }

  changeCompleted(bool value) {
    isCompleted = value;
  }
}