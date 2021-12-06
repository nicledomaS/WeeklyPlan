import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/view_model/daily_model/daily_plan_model.dart';

import 'package:weekly_plan/view/grid_view_scroll_controller.dart';
import 'field_builder.dart';

class DailyPlan extends StatefulWidget {
  final GridDailyPlan _gridDailyPlan;

  DailyPlan(DailyPlanModel model)
    : _gridDailyPlan = GridDailyPlan(model);

  @override
  State<StatefulWidget> createState() => _gridDailyPlan;
}

class GridDailyPlan extends State<DailyPlan> {

  var _fieldBuilder = FieldBuilder();
  var _firstScrollController = GridViewScrollController();
  var _secondScrollController = GridViewScrollController();
  late DailyPlanModel _model;

  GridDailyPlan(this._model) {
    _model.updateCallback = () {
      setState(() {  });
    };
  }

  @override
  void initState() {
    super.initState();
    _firstScrollController.addListener(() {
      //THIS IS called when scroll is triggered,
      _secondScrollController.jumpToWithoutGoingIdleAndKeepingBallistic(
          _firstScrollController.offset); // THIS will sync the scroll;
    });

    _model.preUpdateCallback = () {
      setState(() { _firstScrollController.jumpTo(0.0); });
    };

    _secondScrollController.addListener(() {
      //THIS IS called when scroll is triggered,
      _firstScrollController.jumpToWithoutGoingIdleAndKeepingBallistic(
          _secondScrollController.offset); // THIS will sync the scroll;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Container(
          width: 34,
          child: ListView.builder(
              controller: _firstScrollController,
              padding: const EdgeInsets.all(1),
              itemCount: _model.times.length,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.center,
                    height: 54.6,
                    child: Text(
                      '${_model.times[index]}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF383874),
                      ),
                    ),
                  ),
                );
              }),
        ),
        Expanded(
          child: Container(
            child: GridView.builder(
              controller: _secondScrollController,
              itemCount: _model.getSize(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
              ),
              itemBuilder: (
                context,
                index,
              ) {
                var item = _model.getItem(index);
                return _fieldBuilder.build(index, item);
              },
            ),
            color: Color(0xFFDCE0F3),
          ),
        )
      ],
    ));
  }
}
