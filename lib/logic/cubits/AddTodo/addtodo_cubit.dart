import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todofutterbloc/data/repository.dart';
import 'package:todofutterbloc/logic/cubits/TodosCubit/todos_cubit.dart';

part 'addtodo_state.dart';

class AddtodoCubit extends Cubit<AddtodoState> {
  final Repository? repository;
  final TodosCubit? todosCubit;
  AddtodoCubit({this.todosCubit, this.repository}) : super(AddtodoInitial());

  void addTodo(String message) {
    if (message.isEmpty) {
      emit(AddtodoError(error: "Todo is empty"));
      return;
    }
    emit(AddingTodo());
    Timer(Duration(seconds: 4), () {
      repository!.addTodo(message).then((todo) {
        todosCubit!.addTodo(todo);
        emit(TodoAdded());
      });
    });
    // emit(TodoAdded());
  }
}
