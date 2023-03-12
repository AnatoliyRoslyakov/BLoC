import 'package:bloc_data_api/bloc/user_bloc.dart';
import 'package:bloc_data_api/cubit/internet_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(userRepositiry: userRepositiry),
        ),
        BlocProvider(create: (context) => ConnectionCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
            title: BlocBuilder<ConnectionCubit, MyConnectionState>(
          builder: (context, state) => state.connected
              ? Text('User List (в сети)')
              : const Text(
                  'Нет соединения с интернет!',
                  style: TextStyle(color: Colors.red),
                ),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [ActionButtons(), Expanded(child: UserList())],
        ),
      ),
    );
  }
}
