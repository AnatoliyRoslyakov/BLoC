import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent {
  event_red,
  event_green
} //События(изменение цвета на красный/зеленый)

class ColorBloc {
  Color _color = Colors.red; //default: Красный

//////// ПОТОК СОБЫТИЙ ///////////////////////////////////////////////////////
  // StreamController для взаимодействия с входными событиям
  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink =>
      _inputEventController.sink; // "Геттер" для входного потока
  //Геттер (от англ. get - получить) — это метод, который получает значение
  //определённого свойства
  //Sink - это входной поток событий, куда пользователь добавляет события

//////// ПОТОК СОСТОЯНИЙ /////////////////////////////////////////////////////
  // Состояние от события по изменению цвета является Color
  final _outputStreamController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStreamController.stream;
  //Stream - это выходной поток состояний

//////// МЕТОД ПО ПРЕОБРАЗОВАНИЮ СОБЫТИЙ В СОСТОЯНИЯ /////////////////////////
  void _mapEventToState(ColorEvent event) {
    // В зависимости от события получаем новое состояние
    if (event == ColorEvent.event_red)
      _color = Colors.red;
    else if (event == ColorEvent.event_green)
      _color = Colors.green;
    else
      throw Exception('Неправильный тип события');

    // Добавим новое состояние в выходной поток
    _outputStreamController.sink.add(_color);
  }

//////// ПОДПИСКА НА ВЫХ. ПОТОК /////////////////////////////////////////////
  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

//////// ПО ОКОНЧАНИЮ РАБОТЫ ЗАКРЫВАЕМ ПОТОК ////////////////////////////////
  void dispose() {
    _inputEventController.close();
    _outputStreamController.close();
  }
}
