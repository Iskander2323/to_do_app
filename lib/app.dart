import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/components/bloc/to_do_bloc.dart';
import 'package:to_do_app/components/data/domain/to_do_repository.dart';
import 'package:to_do_app/routes.dart';

class App extends StatelessWidget {
  const App({required this.toDoRepository, super.key});

  final ToDoRepository toDoRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoBloc(dataBaseRepository: toDoRepository),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routes,
      ),
    );
  }
}
