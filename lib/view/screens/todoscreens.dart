import 'package:flutter/material.dart';
import 'package:todofutterbloc/view/routes/routenames.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
