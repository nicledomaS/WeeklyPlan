import 'package:weekly_plan/model/storage_accessor.dart';
import 'package:weekly_plan/view_model/weekly_model/weekly_item.dart';

class WeeklyPlanModel {
  StorageAccessor _storage;
  List<WeekItem> _days = [];
  final int dayInWeek = 7;

  WeeklyPlanModel(this._storage) {
    var now = DateTime.now();
    updateWeek(now.subtract(Duration(days: now.weekday - 1)));
  }

  int getSize() => _days.length;
  WeekItem getItem(int idx) => _days[idx];

  void updateWeek(DateTime date) {
    _days = List.generate(dayInWeek, (index) {
      var nextDate = index == 0 ? date : date.add(Duration(days: index));
      return WeekItem(nextDate, _storage.getTasks(nextDate));
    });
  }
}