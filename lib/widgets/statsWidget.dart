import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "MAX: ${model.getMax()}",
        ),
        Text(
          "MIN: ${model.getMin()}",
        ),
        Text(
          "AVG: ${model.getAvg().toStringAsFixed(2)}",
        ),
        Text(
          "90% bar: ${model.get90().toStringAsFixed(2)}",
        ),
      ],
    );
  }
}
