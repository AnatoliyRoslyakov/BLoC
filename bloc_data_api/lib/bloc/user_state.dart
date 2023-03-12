// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../model/user.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<User> loadedUser;
  UserLoadedState({
    required this.loadedUser,
  });
}

class UserErrorState extends UserState {}
