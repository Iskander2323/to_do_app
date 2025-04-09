import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:to_do_app/components/data/model/to_do_model.dart';
import 'package:to_do_app/components/local_db/globals.dart';

part 'local_db.g.dart';

class ToDoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  BoolColumn get isDone => boolean()();
  DateTimeColumn get createdAt =>
      dateTime().nullable()(); // TO DO: Remove the nullable
}

@DriftDatabase(tables: [ToDoItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ToDoModel>> getToDoList() async {
    var toDoList = <ToDoItem>[];
    try {
      toDoList = await select(toDoItems).get();
    } on Exception catch (e) {
      log(e.toString());
    }
    var result = <ToDoModel>[];
    for (var toDoModel in toDoList) {
      result.add(ToDoModel.fromLocal(toDoModel));
    }
    return result;
  }

  Future<void> createToDo(ToDoModel toDoModel) async {
    try {
      log(toDoModel.toString());
      await database.into(toDoItems).insert(toDoModel.toDoItemsCompanion());
      log('SUCCESSFULLY CREATED');
    } on Exception catch (e) {
      log(e.toString(), name: 'FROM LOCAL DB - createToDo');
    }
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
