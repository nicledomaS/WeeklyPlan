import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/view_model/weekly_model/weekly_plan_model.dart';
import 'package:weekly_plan/view/widgets/weekly_plan/weekly_plan_view.dart';

class WeeklyPlanPage extends StatelessWidget {

  final WeeklyPlanModel _weeklyModel;

  WeeklyPlanPage(this._weeklyModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
          ]
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
          child: Container(
              padding: const EdgeInsets.all(16),
              child: WeeklyPlanView(_weeklyModel)
          )
      ),
    );
  }

}