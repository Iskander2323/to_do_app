import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/components/local_db/local_db.dart';

class ToDoModel extends Equatable {
  const ToDoModel(
      {required this.id,
      required this.title,
      this.description,
      required this.createdAt,
      required this.isDone});
  final int id;
  final String title;
  final String? description;
  final DateTime? createdAt;
  final bool isDone;

  ToDoModel.fromLocal(ToDoItem toDoItem)
      : id = toDoItem.id,
        title = toDoItem.title,
        description = toDoItem.description,
        createdAt = toDoItem.createdAt,
        isDone = toDoItem.isDone;

  ToDoItemsCompanion toDoItemsCompanion() {
    final titleCompanion = Value<String>(title);
    final descriptionCompanion = Value<String?>(description);
    final createdAtCompanion = Value<DateTime?>(createdAt);
    final isDoneCompanion = Value<bool>(isDone);
    return ToDoItemsCompanion(
      id: Value<int>(0),
      title: titleCompanion,
      description: descriptionCompanion,
      createdAt: createdAtCompanion,
      isDone: isDoneCompanion,
    );
  }

  @override
  List<Object?> get props => [id, title, description, createdAt, isDone];
}
