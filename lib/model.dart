import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:max_watts/hiveModel.dart';

class TimerController extends ChangeNotifier {
  late CountdownTimerController _controller;

  void start() {
    _controller.start();
    notifyListeners();
  }

  CountdownTimerController getController() {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
    _controller = CountdownTimerController(endTime: endTime);
    return _controller;
  }
}

class WorkoutController extends ChangeNotifier {
  Workout? workout;
  Box<Workout>? hiveBox;

  WorkoutController() {
    hiveBox = Hive.box('workouts');

    workout = hiveBox!.values.isEmpty ? Workout() : hiveBox!.values.last;
  }

  void append(int record) {
    workout!.append(record);
    workout!.sum += record;

    if (workout!.getSet().length == 1) {
      workout!.max = record;
      workout!.min = record;
    } else if (record > workout!.max) {
      workout!.max = record;
    } else if (record < workout!.min) {
      workout!.min = record;
    }

    workout!.avg = workout!.sum / workout!.getSet().length.toDouble();
    workout!.plank = workout!.avg * 0.9;

    notifyListeners();
    hiveBox!.putAt(0, workout!);
  }

  List<int> getSet() {
    return workout!.getSet();
  }

  int getSize() {
    return workout!.getSet().length;
  }

  int getMax() {
    return workout!.max;
  }

  int getMin() {
    return workout!.min;
  }

  double getAvg() {
    return workout!.avg;
  }

  double get90() {
    return workout!.plank;
  }
}
