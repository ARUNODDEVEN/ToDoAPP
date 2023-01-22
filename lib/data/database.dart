import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase {
  List todolistt = [];
  final _mybox = Hive.box('mybox');

  void createinitaldata() {
    todolistt = [
      ["Make Tutorial", false],
      ['Do Exercise', false],
    ];
  }

  void loaddata() {
    todolistt = _mybox.get("TODOLIST");
  }

  void updatedatabase() {
    _mybox.put("TODOLIST", todolistt);
  }
}
