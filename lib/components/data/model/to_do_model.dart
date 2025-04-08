import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/components/local_db/local_db.dart';

class ToDoModel extends Equatable {
  const ToDoModel(
      {required this.title,
      this.description,
      required this.createdAt,
      required this.isDone});

  final String title;
  final String? description;
  final DateTime createdAt;
  final bool isDone;

  ToDoItemsCompanion toDoItemsCompanion() {
    final titleCompanion = Value<String>(title);
    final descriptionCompanion = Value<String?>(description);
    final createdAtCompanion = Value<DateTime>(createdAt);
    final isDoneCompanion = Value<bool>(isDone);
    return ToDoItemsCompanion(
      title: titleCompanion,
      description: descriptionCompanion,
      createdAt: createdAtCompanion,
      isDone: isDoneCompanion,
    );
  }

  @override
  List<Object?> get props => [title, description, createdAt, isDone];
}
