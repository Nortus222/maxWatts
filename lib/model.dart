import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:gsheets/gsheets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

const WORKOUTS = 'workouts';
const GSHEETSETTINGS = 'gsheetsettings';
const CREDENTIALS = 'credentials';
const SPREADSHEETID = 'spreadsheetid';
const WORKSHEETTITLE = 'worksheettitle';

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
    if (workouts!.isEmpty) {
      add();
    } else {
      lastWorkout = workouts!.last;
      _lastIndex = workouts!.length - 1;
    }
  }

  void remove(int index) {
    workouts!.removeAt(index);

    lastWorkout = workouts!.last;
    _lastIndex = workouts!.isEmpty ? 0 : workouts!.length - 1;

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

  void updateDate(Workout workout) {
    for (int i = 0; i < workouts!.length; i++) {
      if (workouts![i] == workout) {
        workouts![i] = workout;
        _hiveBox!.putAt(i, workout);
        notifyListeners();
        return;
      }
    }
  }
}

class GsheetController extends ChangeNotifier {
  String? credentials;
  String? spreadsheetId;
  String? worksheetTitle;
  Box<String>? _hiveBox;
  bool hasCredentials = false;
  GSheets? gsheets;
  Spreadsheet? spreadsheet;
  Worksheet? sheet;

  GsheetController() {
    _hiveBox = Hive.box(GSHEETSETTINGS);

    if (_hiveBox!.isNotEmpty) {
      credentials = _hiveBox!.get(CREDENTIALS);
      spreadsheetId = _hiveBox!.get(SPREADSHEETID);
      worksheetTitle = _hiveBox!.get(WORKSHEETTITLE);

      if (credentials != null &&
          spreadsheetId != null &&
          worksheetTitle != null) {
        hasCredentials = true;
      }
    }
  }

  Future<bool> loadCredentials() async {
    if (!hasCredentials) {
      return false;
    }

    gsheets = GSheets(jsonDecode(credentials!));

    spreadsheet = await gsheets!.spreadsheet(spreadsheetId!);

    sheet = spreadsheet!.worksheetByTitle(worksheetTitle!);
    print(sheet);

    return !(sheet == null);
  }

  void updateCredentials(String data, String field) {
    switch (field) {
      case SPREADSHEETID:
        spreadsheetId = data;
        break;
      case WORKSHEETTITLE:
        worksheetTitle = data;
        break;
      case CREDENTIALS:
        credentials = data;
        break;
      default:
        break;
    }
    notifyListeners();
    _hiveBox!.put(field, data);
  }

  Future<bool> upload(Workout workout) async {
    DateFormat format = DateFormat.yMd();
    return true;
    return await sheet!.values
        .insertColumnByKey(format.format(workout.date!), workout.getSet());
  }
}
