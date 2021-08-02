import 'package:flutter/material.dart';
import 'package:todofutterbloc/view/screens/addtodoscreen.dart';
import 'package:todofutterbloc/view/screens/edittodoscreen.dart';
import 'package:todofutterbloc/view/screens/todoscreens.dart';

class Router {
  Route generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case ('/'):
        return MaterialPageRoute(builder: (_) => TodoScreen());

      case ('edittodo'):
        return MaterialPageRoute(builder: (_) => EditTodoScreen());

      case ('addtodo'):
        return MaterialPageRoute(builder: (_) => AddTodo());

      default:
        return MaterialPageRoute(builder: (_) => TodoScreen());
    }
  }
}
