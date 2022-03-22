import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

const WORKOUTS = 'workouts';

class TimerController extends ChangeNotifier {
  CustomTimerController? _controller;

  TimerController() {
    _controller = CustomTimerController();
  }

  void start() {
    _controller!.start();
    notifyListeners();
  }

  void reset() {
    _controller!.reset();
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

class WorkoutsController extends ChangeNotifier {
  List<Workout>? workouts;
  Workout? lastWorkout;
  Box<Workout>? _hiveBox;
  int? _lastIndex;

  WorkoutsController() {
    _hiveBox = Hive.box(WORKOUTS);

    workouts = _hiveBox!.values.toList();
    lastWorkout = workouts!.isEmpty ? Workout() : workouts!.last;
    _lastIndex = workouts!.length - 1;
  }

  void remove(int index) {
    workouts!.removeAt(index);

    lastWorkout = workouts!.last;
    _lastIndex = workouts!.length - 1;

    notifyListeners();
    _hiveBox!.deleteAt(index);
  }

  void add() {
    Workout newWorkout = Workout();
    workouts!.add(newWorkout);

    lastWorkout = workouts!.last;
    _lastIndex = workouts!.length - 1;

    notifyListeners();
    _hiveBox!.add(newWorkout);
  }

  void lastAppend(int record) {
    lastWorkout!.append(record);

    notifyListeners();
    _hiveBox!.putAt(_lastIndex!, lastWorkout!);
  }

  void lastRemove(int index) {
    lastWorkout!.remove(index);

    notifyListeners();
    _hiveBox!.putAt(_lastIndex!, lastWorkout!);
  }
}
