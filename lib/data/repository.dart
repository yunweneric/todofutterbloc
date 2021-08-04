import 'package:todofutterbloc/data/ApiService.dart';
import 'package:todofutterbloc/data/model/todo.dart';

class Repository {
  final ApiService? apiService;

  Repository({this.apiService});

  Future<List<Todo>?> fetchTodos() async {
    final todosRaw = await apiService!.fetchTodos();
    return todosRaw!.map((e) => Todo.fromJson(e)).toList();
  }

  Future<bool>? changeCompletion(bool? isCompleted, int? id) async {
    final todosPatch = {"isCompleted": isCompleted.toString()};
    return await apiService!.patchTodo(todosPatch, id);
  }

  Future<Todo> addTodo(String message) async {
    final todoObj = {"todo": message, "isCompleted": "false"};
    final todoMap = await apiService!.addTodo(todoObj);
    return Todo.fromJson(todoMap);
  }
}
