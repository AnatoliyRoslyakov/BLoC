import 'package:bloc_package/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Чтобы связать пользовательский интерфейс с Bloc используем BlocProvider
    return MaterialApp(
        home: BlocProvider(
      create: (context) => ColorBloc(),
      child: HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // реализуем переменную _bloc
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC witch flutter_bloc'),
      ),
      body: Center(
          // Для перерисовки обернем в BlocBuilder
          child: BlocBuilder<ColorBloc, Color>(
              builder: (context, currentColor) => AnimatedContainer(
                    height: 100,
                    width: 100,
                    color: currentColor,
                    duration: Duration(milliseconds: 500),
                  ))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                _bloc.add(RedColorEvent());
              },
              backgroundColor: Colors.red),
          SizedBox(width: 10),
          FloatingActionButton(
              onPressed: () {
                _bloc.add(GreenColorEvent());
              },
              backgroundColor: Colors.green)
        ],
      ),
    );
  }
}
