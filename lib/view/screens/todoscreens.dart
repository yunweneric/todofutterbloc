import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todofutterbloc/logic/cubits/TodosCubit/todos_cubit.dart';
import 'package:todofutterbloc/view/routes/routenames.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TodosCubit>(context).fetchTodos();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, addTodoRoute);
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              minorspacer(),
              Center(
                  child: Text(
                'ALL TODOS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                ),
              )),
              majorspacer(),
              BlocBuilder<TodosCubit, TodosState>(
                builder: (context, state) {
                  if (state is TodosInitial)
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  final todos = (state as TodosLoaded).todos;
                  return Container(
                    child: Column(
                      children: todos!
                          .map((todo) => Container(
                                child: Dismissible(
                                  key: Key("${todo.id}"),
                                  child: Column(
                                    children: [
                                      Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(todo.todoMessage as String),
                                              CircleAvatar(
                                                radius: 10.0,
                                                backgroundColor:
                                                    todo.isCompleted == "true"
                                                        ? Colors.green
                                                        : Colors.red,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      minorspacer()
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  );
                },
              )
            ],
          ),
        ));
  }

  SizedBox minorspacer() {
    return SizedBox(
      height: 10.0,
    );
  }

  SizedBox majorspacer() {
    return SizedBox(
      height: 30.0,
    );
  }
}
