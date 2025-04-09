part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

final class CreateToDoEvent extends ToDoEvent {
  final ToDoModel toDoModel;
  const CreateToDoEvent({required this.toDoModel});
}

final class GetToDoListInitialEvent extends ToDoEvent {}
