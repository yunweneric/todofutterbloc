import 'package:todofutterbloc/data/ApiService.dart';
import 'package:todofutterbloc/data/model/todo.dart';

class Repository {
  final ApiService? apiService;

  Repository({this.apiService});

  Future<List<Todo>?> fetchTodos() async {
    final todosRaw = await apiService!.fetchTodos();
    return todosRaw!.map((e) => Todo.fromJson(e)).toList();
  }
}
