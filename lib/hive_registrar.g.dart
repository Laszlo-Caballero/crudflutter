// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:crudflutter/models/todo.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(TodoAdapter());
  }
}

extension IsolatedHiveRegistrar on IsolatedHiveInterface {
  void registerAdapters() {
    registerAdapter(TodoAdapter());
  }
}
