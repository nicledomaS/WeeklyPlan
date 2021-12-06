import 'daily_model/daily_plan_model.dart';

enum DateType
{
  Current,
  Previous,
  Next
}

class DayString
{
  late String _week = "";
  late String _day = "";

  DayString(this._week, this._day);

  get week => _week;
  get day => _day;
}

class DatePanelController
{
  dynamic _dayData =
  { 1 : "Mon", 2 : "Tue", 3 : "Wed", 4 : "Thur", 5 : "Fri", 6 : "Sat", 7 : "Sun" };

  DatePanelController(this.model);

  late DailyPlanModel model;
  late DateTime currentDate = DateTime.now();

  void previous()
  {
    currentDate = currentDate.subtract(const Duration(days: 1));
    model.notify(currentDate);
  }
  void next()
  {
    currentDate = currentDate.add(const Duration(days: 1));
    model.notify(currentDate);
  }

  DayString getDay(DateType type)
  {
    switch (type) {
      case DateType.Current:
        return DayString(
            _dayData[currentDate.weekday],
            currentDate.day.toString());
      case DateType.Previous:
        var previousDate = currentDate.subtract(const Duration(days: 1));
        return DayString(
            _dayData[previousDate.weekday],
            previousDate.day.toString());
      case DateType.Next:
        var nextDate = currentDate.add(const Duration(days: 1));
        return DayString(
            _dayData[nextDate.weekday],
            nextDate.day.toString());
      default:
        return DayString(
            _dayData[currentDate.weekday],
            currentDate.day.toString());
    }
  }
}