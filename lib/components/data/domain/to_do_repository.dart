import 'dart:developer';

import 'package:to_do_app/components/data/abstract/data_base_interface.dart';
import 'package:to_do_app/components/data/model/to_do_model.dart';
import 'package:to_do_app/components/local_db/globals.dart';

class ToDoRepository implements DataBaseInterface {
  @override
  Future<void> createToDo(ToDoModel toDoModel) async {
    try {
      await database.createToDo(toDoModel);
    } on Exception catch (e) {
      log(e.toString(), name: '');
    }
  }

  @override
  Future<List<ToDoModel>?> getToDoList() async {
    try {
      final toDoList = await database.getToDoList();
      return toDoList;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
