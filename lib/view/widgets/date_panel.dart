import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/view_model/date_panel_controller.dart';

const grayColor = Color(0xFFA2A7B7);
const blueColor = Colors.blue;

class DatePanel extends StatefulWidget {
  late final DatePanelState datePanelState;

  DatePanel(DatePanelController controller) {
    datePanelState = DatePanelState(controller);
  }

  @override
  State<StatefulWidget> createState() => datePanelState;
}

class DatePanelState extends State<DatePanel> {
  late DatePanelController _controller;

  DatePanelState(this._controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        createTextButton(DateType.Previous, () {
          setState(() {
            _controller.previous();
          });
        }),
        createText(),
        createTextButton(DateType.Next, () {
          setState(() {
            _controller.next();
          });
        }),
      ],
    );
  }

  Widget createWeekText(String week, Color color) {
    return Text(
      week,
      style: TextStyle(
        fontSize: 12,
        color: color,
      ),
    );
  }

  Widget createDayText(String day, Color color) {
    return Text(
        day,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: color,
    ));
  }

  Widget createTextButton(DateType type, Function onPress) {
    var dayString = _controller.getDay(type);
    return Container(
      child: TextButton(
        onPressed: () {
          onPress();
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                createWeekText(dayString.week, grayColor),
                createDayText(dayString.day, grayColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget createText() {
    var dayString = _controller.getDay(DateType.Current);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createWeekText(dayString.week, blueColor),
          createDayText(dayString.day, blueColor),
        ],
      ),
    );
  }
}
