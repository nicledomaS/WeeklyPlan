import 'dart:ui';

import 'package:weekly_plan/utils.dart';

enum Priority {
  Unknown,
  Low,
  Medium,
  High
}

class Task
{
  late String _projectName;
  late String _taskName;
  late Color _color;
  late int _startPlannedItem;
  late int _during;
  late Priority _priority;

  Task(
      this._projectName,
      this._taskName,
      this._color,
      this._startPlannedItem,
      this._during,
      this._priority);

  String get projectName => _projectName;
  String get taskName => _taskName;
  Color get color => _color;
  int get startPlannedItem => _startPlannedItem;
  int get during => _during;
  Priority get priority => _priority;

  bool isIncludedTime(int time) => time >= _startPlannedItem && time < _startPlannedItem + _during;
  bool isStart(int index) => _startPlannedItem == index;
  bool isEnd(int index) => (_startPlannedItem + _during) - 1 == index;
}

Task? getTaskByTime(int time, List<Task> tasks)
{
  Task? currentTask;
  if(time >= 0 && time < 6 * 24)
  {
    for (var task in tasks) {
      if (task.isIncludedTime(time)) {
        currentTask = task;
      }
    }
  }
  return currentTask;
}

bool isSameProject(Task lhs, Task rhs) {
  return lhs.projectName == rhs.projectName;
}

bool isEnds(int index, int rows, Task task) {
  return task.isStart(index) || task.isEnd(index) ||
      isFirstColumn(index, rows) || isLastColumn(index, rows);
}