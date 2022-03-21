import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TimerController extends ChangeNotifier {
  CustomTimerController? _controller;

  TimerController() {
    _controller = CustomTimerController();
  }

  void start() {
    _controller!.start();
    notifyListeners();
  }

  CustomTimerController getController() {
    return _controller!;
  }
}

class ListScrollController extends ChangeNotifier {
  AutoScrollController? _controller;

  ListScrollController() {
    _controller = AutoScrollController();
  }

  AutoScrollController getController() {
    return _controller!;
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

    notifyListeners();
    hiveBox!.putAt(0, workout!);
  }

  void remove(int index) {
    workout!.remove(index);

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
