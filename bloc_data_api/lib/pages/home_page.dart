import 'package:bloc_data_api/bloc/user_bloc.dart';
import 'package:bloc_data_api/services/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final userRepositiry = UserRepositiry();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepositiry: userRepositiry),
      child: Scaffold(
        appBar: AppBar(title: Text('User list')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ActionButtons(), Expanded(child: UserList())],
        ),
      ),
    );
  }
}
