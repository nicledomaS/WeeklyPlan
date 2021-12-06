import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/model/storage_accessor.dart';
import 'package:weekly_plan/model/task.dart';
import 'package:weekly_plan/subscriber.dart';
import 'package:weekly_plan/utils.dart';

class Field
{}

class TextBuilder{}

class _IntersectionSide {
  static const Left = 0x01;
  static const Right = 0x02;
  static const Top = 0x04;
  static const Bottom = 0x08;
}

class DailyPlanModel implements Subscriber {

  static const int _row = 6;
  static const int _column = 24;
  var _times = List<String>.generate(_column, (int index) => "${index.toString().padLeft(2, '0')}:00");
  var _fields = List.generate(_row * _column, (int) => Field());

  late StorageAccessor _storage;
  late List<Task> _tasks = List.empty();

  late VoidCallback _updateCallback = () {
    //TODO
  };

  late VoidCallback _preUpdateCallback = () {
    //TODO
  };

  set updateCallback(func) => _updateCallback = func;
  set preUpdateCallback(func) => _preUpdateCallback = func;
  get times => _times;

  DailyPlanModel(this._storage) {
    _updateDay(DateTime.now());
  }

  int getSize() => _fields.length;
  Field? getItem(int index) => _fields[index];

  void _updateDay(DateTime day) {

  }

  void _updateFieldById(int id, Task? task, TextBuilder? textBuilder) {

  }

  @override
  void notify(DateTime date) {
    _updateDay(date);
  }
}