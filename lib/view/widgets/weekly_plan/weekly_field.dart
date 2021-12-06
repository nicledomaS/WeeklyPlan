import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:weekly_plan/view_model/weekly_model/weekly_item.dart';
import 'chip_column.dart';

class WeeklyField extends StatelessWidget
{
  final dynamic _dayData = {
    1: "Mo",
    2: "Tu",
    3: "We",
    4: "Th",
    5: "Fr",
    6: "Sa",
    7: "Su"
  };
  final WeekItem _item;

  WeeklyField(this._item);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.0, top: 8.0),
            child: _buildDate(),
          ),
          _createChips(),
          Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: _createPercentIndicator())
        ],
      ),
    ));
  }

  Widget _buildDate() {
    return Container(
      width: 34,
      alignment: Alignment.centerLeft,
      child: Column(
            children: [
              Text(
                _dayData[_item.getDate().weekday],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Roboto',
                  color: Color(0xFF383874),
                ),
              ),
              Text(
                _item.getDate().day.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF383874),
                ),
              ),
            ],
          ),
    );
  }

  Widget _createChips() {
    return ChipColumn(_item.getDate(), _item.getPriorityTask());
  }

  Widget _createPercentIndicator() {
    return LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              child: CircularPercentIndicator(
                radius: constraints.maxHeight / 2,
                lineWidth: 3.0,
                backgroundWidth: 2.0,
                percent: _item.getPercent(true).toInt() / 100,
                center: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: _item.getPercent(true).toInt().toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFF383874),
                        ),
                      ),
                      TextSpan(
                          text: '%',
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Roboto',
                            color: Color(0xFF383874),
                          )),
                    ],
                  ),
                ),
                backgroundColor: Color(0xFFDCE0F3),
                progressColor: Color(0xFF01F1E4),
              )
          );
        },
    );
  }
}