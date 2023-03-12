import 'package:bloc_data_api/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(
            child: Text('No data received. Please button "Load"'));
      }
      if (state is UserLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: ((context, index) {
              return Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                    leading: Text('ID: ${state.loadedUser[index].id}'),
                    title:
                        Center(child: Text('${state.loadedUser[index].name}')),
                    subtitle: Column(
                      children: [
                        Text('${state.loadedUser[index].phone}'),
                        Text('${state.loadedUser[index].email}'),
                      ],
                    )

                    // title: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [Text('Name'), Text('Phone'), Text('Email')]),
                    ),
              );
            }));
      }
      if (state is UserErrorState) {
        const Center(child: Text('Error fetching users'));
      }
      return const SizedBox.shrink();
    });
  }
}
