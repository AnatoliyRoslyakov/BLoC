import 'package:bloc_data_api/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            child: Text('Load')),
        SizedBox(width: 10),
        ElevatedButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            child: Text('Clear')),
      ],
    );
  }
}
