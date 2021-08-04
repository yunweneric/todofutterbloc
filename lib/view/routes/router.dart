import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todofutterbloc/data/ApiService.dart';
import 'package:todofutterbloc/data/repository.dart';
import 'package:todofutterbloc/logic/cubits/AddTodo/addtodo_cubit.dart';
import 'package:todofutterbloc/logic/cubits/TodosCubit/todos_cubit.dart';
import 'package:todofutterbloc/view/routes/routenames.dart';
import 'package:todofutterbloc/view/screens/addtodoscreen.dart';
import 'package:todofutterbloc/view/screens/edittodoscreen.dart';
import 'package:todofutterbloc/view/screens/todoscreens.dart';

class AppRouter {
  Repository? repository;
  TodosCubit? todosCubit;
  AppRouter() {
    repository = Repository(apiService: ApiService());
    todosCubit = TodosCubit(repository: repository);
  }

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case todosRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: todosCubit!,
            child: TodoScreen(),
          ),
        );

      case editTodoRoute:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());

      case addTodoRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddtodoCubit(
                    repository: repository,
                    todosCubit: todosCubit,
                  ),
                  child: AddTodo(),
                ));

      default:
        return MaterialPageRoute(builder: (_) => TodoScreen());
    }
  }
}
