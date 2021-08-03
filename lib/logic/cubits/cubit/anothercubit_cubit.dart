import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anothercubit_state.dart';

class AnothercubitCubit extends Cubit<AnothercubitState> {
  AnothercubitCubit() : super(AnothercubitInitial());
}
