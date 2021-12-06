import 'package:weekly_plan/view/widgets/weekly_plan/weekly_plan_view.dart';
import 'package:weekly_plan/view_model/weekly_model/weekly_plan_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:weekly_plan/model/storage_accessor.dart';
import 'package:weekly_plan/view_model/daily_model/daily_plan_model.dart';
import 'package:weekly_plan/view_model/date_panel_controller.dart';
import 'package:weekly_plan/view/widgets/date_panel.dart';

void main() {
  runApp(WeeklyPlanApp());
}

class WeeklyPlanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class StartHomePage extends StatefulWidget {
  StartHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _StartHomePageState createState() => _StartHomePageState();
}

class _StartHomePageState extends State<StartHomePage> {
  late var _storage = StorageAccessor();
  late var model = DailyPlanModel(_storage);
  late var _weeklyModel = WeeklyPlanModel(_storage);
  late DatePanelController controller = DatePanelController(model);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              //children: [DatePanel(controller), DailyPlan(model)]
              children: [DatePanel(controller), WeeklyPlanView(_weeklyModel)]
          )
        )
      ),
    );
  }
}
