import 'package:bloc_data_api/bloc/user_event.dart';
import 'package:bloc_data_api/bloc/user_state.dart';
import 'package:bloc_data_api/services/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositiry userRepositiry;
  UserBloc({required this.userRepositiry}) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<User> loadedUserList = await userRepositiry.getAllUsers();
        emit(UserLoadedState(loadedUser: loadedUserList));
      } catch (e) {
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
