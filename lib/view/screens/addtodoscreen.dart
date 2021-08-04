import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todofutterbloc/data/model/todo.dart';
import 'package:todofutterbloc/logic/cubits/AddTodo/addtodo_cubit.dart';
import 'package:todofutterbloc/view/widgets/constats.dart';

class AddTodo extends StatelessWidget {
  final TextEditingController todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocListener<AddtodoCubit, AddtodoState>(
          listener: (context, state) {
            if (state is TodoAdded) {
              Navigator.pop(context);
            }
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ADD TODOS',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                majorspacer(),
                TextField(
                  controller: todoController,
                  onChanged: (_) {
                    // print(todoController.text);
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Enter your todo",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                majorspacer(),
                Container(
                  width: screenWidth(context) / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      final message = todoController.text;
                      BlocProvider.of<AddtodoCubit>(context).addTodo(message);
                    },
                    child: BlocBuilder<AddtodoCubit, AddtodoState>(
                      builder: (context, state) {
                        if (state is AddingTodo) {
                          return SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.white,
                            ),
                          );
                        }
                        return Text('Add Todo');
                      },
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: EdgeInsets.all(
                        20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
