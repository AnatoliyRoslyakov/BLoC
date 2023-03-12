import 'package:bloc_data_api/services/user_api_provider.dart';

import '../model/user.dart';

class UserRepositiry {
  final UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers() => _userProvider.getUsers();
}
