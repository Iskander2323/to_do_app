import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/components/data/abstract/data_base_interface.dart';
import 'package:to_do_app/components/data/model/to_do_model.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final DataBaseInterface _dataBaseRepository;
  ToDoBloc({required DataBaseInterface dataBaseRepository})
      : _dataBaseRepository = dataBaseRepository,
        super(ToDoState()) {
    on<CreateToDoEvent>(_createToDo);
  }

  Future<void> _createToDo(
      CreateToDoEvent event, Emitter<ToDoState> emit) async {
    try {
      await _dataBaseRepository.createToDo(event.toDoModel);
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
