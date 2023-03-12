import 'package:bloc_example/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorBloc _bloc = ColorBloc(); //Инициализируем
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC witch Stream'),
      ),
      body: Center(
        //оборачиваем контейнер в StreamBuilder
        child: StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: Colors.red,
            builder: (context, snapshot) {
              return AnimatedContainer(
                height: 100,
                width: 100,
                color: snapshot.data,
                duration: Duration(milliseconds: 500),
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              // Передаем событие
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_red);
              },
              backgroundColor: Colors.red),
          SizedBox(width: 10),
          FloatingActionButton(
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.event_green);
              },
              backgroundColor: Colors.green)
        ],
      ),
    );
  }
}
