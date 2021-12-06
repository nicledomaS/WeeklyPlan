import 'package:weekly_plan/view/pages/stub_weekly_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/Utils.dart';
import 'package:weekly_plan/model/task.dart';

enum TextFieldType {
  All,
  OnlyName
}

class _ChipData {
  Task _task;
  TextFieldType _type;
  double _height;
  var _delimeter = ' / ';

  var _projectStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Color(0xFF383874),
  );
  var _nameStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: Color(0xFF383874),
  );

  _ChipData(this._task, this._type, this._height);

  get task => _task;
  Color get color => _task.color;
  int get length =>
      _type == TextFieldType.All ?
      _task.projectName.length + _task.taskName.length : _task.taskName.length;
  double get textWidth => _type == TextFieldType.All ?
    calcTextSize(_task.projectName, _projectStyle).width + calcTextSize(_task.taskName + _delimeter, _nameStyle).width :
    calcTextSize(_task.taskName + _delimeter, _nameStyle).width;
  double get height => _height;

  Widget buildRichText() =>
      _type == TextFieldType.All ?
      _buildAllRichText() : _buildOnlyNameRichText();

  Widget _buildAllRichText() {
    return Container(
      height: _height,
      child: RichText(
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(text: _task.projectName, style: _projectStyle),
            TextSpan(text: _delimeter, style: _nameStyle),
            TextSpan(text: _task.taskName, style: _nameStyle),
          ],
        ),
      ),
    );
  }

  Widget _buildOnlyNameRichText() {
    return Container(
      height: _height,
      child: RichText(
        textAlign: TextAlign.center,
        softWrap: false,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(text: _task.taskName, style: _nameStyle),
      )
    );
  }
}

bool _isExpanded(_ChipData current, _ChipData other, double maxSize) {
  return current.length > other.length || current.textWidth > maxSize;
}

class ChipColumn extends StatelessWidget {
  DateTime _date;
  final List<Task> _tasks;
  final double _heightRatio = 3.35;
  final int _maxTaskCount = 3;

  ChipColumn(this._date, this._tasks);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _tasks.isEmpty ?
      GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StubWeeklyPage(_date, null)),
            );
          },
      ) :
      LayoutBuilder(
        builder: (context, constraints) {
          return Wrap(
            runSpacing: 6,
            children: _buildChips(constraints.maxHeight),
          );
        },
    ));
  }

  List<Widget> _buildChips(double mainHeight) {
    Set<String> projects = {};
    List<_ChipData> chipData = [];
    var fieldHeight = mainHeight / _heightRatio;
    _tasks.forEach((element) {
      if (element.projectName.isEmpty || projects.contains(element.projectName)) {
        chipData.add(_ChipData(element, TextFieldType.OnlyName, fieldHeight));
      } else {
        projects.add(element.projectName);
        chipData.add(_ChipData(element, TextFieldType.All, fieldHeight));
      }
    });

    List<Widget> widgets = [];
    if (chipData.length < _maxTaskCount) {
          widgets = List.generate(chipData.length, (index) {
            return _buildChip(chipData[index], true);
          });
        } else {
          var firstCount = chipData[0].length;
          var lastCount = chipData[2].length;

          if (firstCount < lastCount) {
            widgets.add(LayoutBuilder(builder: (context, constraints) => Row(
              children: [
                _buildChip(chipData[0], _isExpanded(chipData[0], chipData[1], constraints.maxWidth / 2)),
                SizedBox(width: 3),
                _buildChip(chipData[1], _isExpanded(chipData[1], chipData[0], constraints.maxWidth / 2)),
              ],
            )));
            widgets.add(Row(children: [_buildChip(chipData[2], true)]));
          } else {
            widgets.add(Row(children: [_buildChip(chipData[0], true)]));
            widgets.add(LayoutBuilder(builder: (context, constraints) => Row(
              children: [
                _buildChip(chipData[1], _isExpanded(chipData[1], chipData[2], constraints.maxWidth / 2)),
                SizedBox(width: 3),
                _buildChip(chipData[2], _isExpanded(chipData[2], chipData[1], constraints.maxWidth / 2)),
              ],
            )));
          }
        }

    return widgets;
  }

  Widget _buildChip(_ChipData data, bool isExpand) {
    var container = Container(
        height: data.height,
        child: LayoutBuilder(
            builder: (context, constraints) {
              var text = isExpand ?
                Container(
                  width: constraints.maxWidth, child: data.buildRichText(),) :
              data.buildRichText();

              return ActionChip(
                label: text,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StubWeeklyPage(_date, data.task)),
                  );
                },
                backgroundColor: data.color.withOpacity(0.46),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                padding: EdgeInsets.zero,
              );
            }
        )
    );

    return isExpand ? Expanded(child: container) : container;
  }
}