import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/view/widgets/weekly_plan/weekly_field.dart';
import 'package:weekly_plan/view_model/weekly_model/weekly_plan_model.dart';

class WeeklyPlanView extends StatefulWidget {
  final WeeklyPlanModel _model;

  WeeklyPlanView(this._model);

  @override
  State<StatefulWidget> createState() => _WeeklyPlanView();
}

class _WeeklyPlanView extends State<WeeklyPlanView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: List.generate(7, (index) {
          var item = widget._model.getItem(index);
          return Expanded(
              child: Column(
                children: [
                  Divider(height: 1, color: Color(0xFFDCE0F3),),
                  WeeklyField(item),
                ],
              )
          );
        }),
      ),
    );
  }
}