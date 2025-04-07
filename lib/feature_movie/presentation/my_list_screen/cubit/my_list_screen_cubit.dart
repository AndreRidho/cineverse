import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_list_screen_state.dart';

class MyListScreenCubit extends Cubit<MyListScreenState> {
  MyListScreenCubit() : super(MyListScreenInitial());
}
