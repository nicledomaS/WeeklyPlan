import 'package:weekly_plan/model/task.dart';

extension on Priority {
  int compareTo(Priority rhs) => this.index.compareTo(rhs.index);
}

class WeekItem {
  DateTime _date;
  List<Task> _tasks;
  double _plannedPercent = 0.0;

  WeekItem(this._date, this._tasks) {
    int allTime = 0;
    _tasks.forEach((task) { allTime += task.during; });

    if(allTime > 0) {
      _plannedPercent = allTime / (144 / 100);
      _tasks.sort((lhs, rhs) {
        var res = rhs.priority.compareTo(lhs.priority);
        return res == 0 ? rhs.during.compareTo(lhs.during) : res;
      });
    }
  }

  DateTime getDate() => _date;
  List<Task> getPriorityTask() => _tasks.length > 3 ? _tasks.sublist(0, 3) : _tasks;
  double getPercent(bool isPlanned) => isPlanned ? _plannedPercent : 100.0 - _plannedPercent;
}