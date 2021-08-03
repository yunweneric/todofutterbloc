import 'package:flutter/material.dart';
import 'package:todofutterbloc/view/routes/routenames.dart';
import 'package:todofutterbloc/view/screens/addtodoscreen.dart';
import 'package:todofutterbloc/view/screens/edittodoscreen.dart';
import 'package:todofutterbloc/view/screens/todoscreens.dart';

class AppRouter {
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case todosRoute:
        return MaterialPageRoute(builder: (_) => TodoScreen());

      case editTodoRoute:
        return MaterialPageRoute(builder: (_) => EditTodoScreen());

      case addTodoRoute:
        return MaterialPageRoute(builder: (_) => AddTodo());

      default:
        return MaterialPageRoute(builder: (_) => TodoScreen());
    }
  }
}
