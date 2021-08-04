import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todofutterbloc/data/ApiService.dart';
import 'package:todofutterbloc/data/model/todo.dart';
import 'package:todofutterbloc/data/repository.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final Repository? repository;
  TodosCubit({this.repository}) : super(TodosInitial());

  void fetchTodos() {
    Timer(Duration(seconds: 2), () {
      repository!.fetchTodos().then((todos) {
        emit(TodosLoaded(todos: todos));
      });
    });
  }

  void changeCompletion(Todo todo) {
    repository!.changeCompletion(todo.isCompleted, todo.id)!.then((isChanged) {
      todo.isCompleted = !todo.isCompleted!;
      final currentState = state;
      if (currentState is TodosLoaded) {
        emit(TodosLoaded(todos: currentState.todos));
      }
    });
  }

  void addTodo(Todo todo) {
    final currentState = state;
    if (currentState is TodosLoaded) {
      final todoList = currentState.todos;
      todoList!.add(todo);
      emit(TodosLoaded(todos: todoList));
    }
  }
}
