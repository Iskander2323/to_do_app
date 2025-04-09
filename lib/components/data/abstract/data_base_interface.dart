import 'package:to_do_app/components/data/model/to_do_model.dart';

class DataBaseInterface {
  Future<void> createToDo(ToDoModel toDoModel) async {}
  Future<List<ToDoModel>?> getToDoList() async {
    return null;
  }
}
