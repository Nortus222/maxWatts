import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';

class Stats extends StatelessWidget {
  Workout workout;
  Stats(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "MAX: ${workout.max}",
        ),
        Text(
          "MIN: ${workout.min}",
        ),
        Text(
          "AVG: ${workout.avg.toStringAsFixed(2)}",
        ),
        Text(
          "90% bar: ${workout.plank.toStringAsFixed(2)}",
        ),
      ],
    );
  }
}
