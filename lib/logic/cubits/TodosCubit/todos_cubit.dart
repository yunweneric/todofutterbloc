import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todofutterbloc/data/model/todo.dart';
import 'package:todofutterbloc/data/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository? repository;
  TodosCubit({this.repository}) : super(TodosInitial());

  void fetchTodos() {
    Timer(Duration(seconds: 10), () {
      repository!.fetchTodos().then((todos) {
        emit(TodosLoaded(todos: todos));
      });
    });
  }
}
