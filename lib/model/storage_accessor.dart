import 'package:flutter/material.dart';

import 'task.dart';

class StorageAccessor
{
  late Map<int, List<Task>> plan = {
    1: [
      Task("Personal time", "Home work", Colors.deepOrange, 0, 6, Priority.Low),
      Task("Personal time", "Sleep", Colors.deepOrange, 6, 3, Priority.Low),
      Task("English", "Listening", Colors.pink, 9, 8, Priority.Medium),
      Task("Sport", "Exercise", Colors.teal, 17, 1, Priority.Low),
      Task("English", "Learning words            ", Colors.pink, 20, 6, Priority.High)
    ],
    2: [
      Task("English", "Writing essay", Colors.red, 0, 2, Priority.High),
      Task("English", "Listening", Colors.red, 2, 2, Priority.High),
      Task("Personal time", "Lunch", Colors.lightGreen, 4, 1, Priority.Low),
      Task("Antt", "Writing code", Colors.indigo, 5, 10, Priority.High),
      Task("Antt", "Testing", Colors.indigo, 15, 7, Priority.High)
    ],
    3: [
      Task("Antt", "Design functions", Colors.purpleAccent, 0, 7, Priority.High),
      Task("Antt", "Code review", Colors.purpleAccent, 7, 3, Priority.Medium),
      Task("Personal time", "Walking", Colors.lightGreen, 10, 1, Priority.Low),
    ],
    6: [
      Task("Personal time", "Home work", Colors.deepOrange, 0, 6, Priority.Low),
      Task("Personal time", "Sleep", Colors.deepOrange, 6, 3, Priority.Low),
      Task("English", "Listening", Colors.pink, 9, 8, Priority.Medium),
      Task("Sport", "Exercise", Colors.teal, 17, 1, Priority.Low),
      Task("English", "Learning words            ", Colors.pink, 20, 6, Priority.High)
    ],
    7: [
      Task("English", "Writing essay", Colors.red, 0, 2, Priority.High),
      Task("English", "Listening", Colors.red, 2, 2, Priority.High),
      Task("Personal time", "Lunch", Colors.lightGreen, 4, 1, Priority.Low),
      Task("Antt", "Writing code", Colors.indigo, 5, 10, Priority.High),
      Task("Antt", "Testing", Colors.indigo, 15, 7, Priority.High)
    ],
    8: [
      Task("Antt", "Design functions", Colors.purpleAccent, 0, 7, Priority.High),
      Task("Antt", "Code review", Colors.purpleAccent, 7, 3, Priority.Medium),
      Task("Personal time", "Walking", Colors.lightGreen, 10, 1, Priority.Low),
    ],
    9: [
      Task("Personal time", "Home work                ", Colors.deepOrange, 0, 6, Priority.Low),
      Task("Personal time", "Sleep", Colors.deepOrange, 6, 3, Priority.Low),
      Task("English", "Listening", Colors.pink, 9, 8, Priority.Medium),
      Task("Sport", "Exercise", Colors.teal, 17, 1, Priority.Low),
      Task("English", "Learning words                   ", Colors.pink, 20, 6, Priority.High)
    ],
    10: [
      Task("English", "Writing essay", Colors.red, 0, 2, Priority.High),
      Task("English", "Listening", Colors.red, 2, 2, Priority.High),
      Task("Personal time", "Lunch", Colors.lightGreen, 4, 1, Priority.Low),
      Task("Antt", "Writing code", Colors.indigo, 5, 10, Priority.High),
      Task("Antt", "Testing", Colors.indigo, 15, 7, Priority.High)
    ],
    23: [
      Task("Personal time", "Home work                ", Colors.deepOrange, 0, 6, Priority.Low),
      Task("Personal time", "Sleep", Colors.deepOrange, 6, 3, Priority.Low),
      Task("English", "Listening", Colors.pink, 9, 8, Priority.Medium),
      Task("Sport", "Exercise", Colors.teal, 17, 1, Priority.Low),
      Task("English", "Learning words                   ", Colors.pink, 20, 6, Priority.High)
    ],
    26: [
      Task("English", "Writing essay", Colors.red, 0, 2, Priority.High),
      Task("English", "Listening", Colors.red, 2, 2, Priority.High),
      Task("Personal time", "Lunch", Colors.lightGreen, 4, 1, Priority.Low),
      Task("Antt", "Writing code", Colors.indigo, 5, 10, Priority.High),
      Task("Antt", "Testing", Colors.indigo, 15, 7, Priority.High)
    ]
  };

  List<Task> getTasks(DateTime day)
  {
    var tasks = plan[day.day];
    return tasks == null ? [] : tasks;
  }
}