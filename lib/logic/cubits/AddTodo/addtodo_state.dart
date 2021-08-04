part of 'addtodo_cubit.dart';

@immutable
abstract class AddtodoState {}

class AddtodoInitial extends AddtodoState {}

class AddtodoError extends AddtodoState {
  final String? error;

  AddtodoError({this.error});
}

class AddingTodo extends AddtodoState {}

class TodoAdded extends AddtodoState {}
