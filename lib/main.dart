import 'package:flutter/material.dart';
import 'package:to_do_app/app.dart';
import 'package:to_do_app/components/data/domain/to_do_repository.dart';

void main() {
  final ToDoRepository tdr = ToDoRepository();
  runApp(App(toDoRepository: tdr));
}
