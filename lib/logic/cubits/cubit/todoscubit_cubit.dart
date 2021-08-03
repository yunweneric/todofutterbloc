import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todoscubit_state.dart';

class TodoscubitCubit extends Cubit<TodoscubitState> {
  TodoscubitCubit() : super(TodoscubitInitial());
}
