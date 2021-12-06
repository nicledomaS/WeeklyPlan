import 'package:weekly_plan/model/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StubWeeklyPage extends StatelessWidget {
  final DateTime _date;
  final Task? _task;

  StubWeeklyPage(this._date, this._task);

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
              child: Column(
                children: [
                  Align(child: Text("Date: ${_date.day}.${_date.month}.${_date.year}"),alignment: Alignment.centerLeft,),
                  Align(child:_task == null ? Text("Open daily plan.") : _buildTaskName(),alignment: Alignment.centerLeft,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Go back!'),
                  ),
                ],
              ),
              )
          )
    );
  }

  Widget _buildTaskName() {
    var text = _task!.projectName.isNotEmpty ?
    "${_task!.projectName} / ${_task!.taskName}" : _task!.taskName;
    return Text("Open daily plan. Focus on task: $text");
  }
}