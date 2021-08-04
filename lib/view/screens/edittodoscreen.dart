import 'package:flutter/material.dart';
import 'package:todofutterbloc/view/widgets/constats.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'UPDATE TODOS',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              majorspacer(),
            ],
          ),
        ),
      ),
    );
  }
}
