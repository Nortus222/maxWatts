import 'package:flutter/material.dart';

class Timer extends ChangeNotifier {}

class Workout extends ChangeNotifier {
  late DateTime date;
  late List<int> set;

  void append(int record) {
    set.add(record);

    notifyListeners();
  }

  //TODO: check max min avg on append

  Workout() {
    date = DateTime.now();
    set = [];
  }

  int getSize() {
    return set.length;
  }

  int getMax() {
    if (set.isEmpty) {
      return 0;
    }

    int max = set[0];

    for (int i = 1; i < set.length; i++) {
      if (set[i] > max) {
        max = set[i];
      }
    }

    return max;
  }

  int getMin() {
    if (set.isEmpty) {
      return 0;
    }

    int min = set[0];

    for (int i = 1; i < set.length; i++) {
      if (set[i] < min) {
        min = set[i];
      }
    }

    return min;
  }

  double getAvg() {
    if (set.isEmpty) {
      return 0;
    }

    int sum = 0;
    for (int i = 0; i < set.length; i++) {
      sum += set[i];
    }

    return sum / set.length.toDouble();
  }

  double get90() {
    if (set.isEmpty) {
      return 0;
    }

    return getAvg() * 0.9;
  }
}
