import 'package:hive_flutter/hive_flutter.dart';

class Data {
  static List taskList = [];

  final _myListTodo = Hive.box('todo');

  void loadData() {
    taskList = _myListTodo.get('TASKLIST') ?? [];
  }

  void updateDatabase() {
    _myListTodo.put("TASKLIST", taskList);
  }
}
