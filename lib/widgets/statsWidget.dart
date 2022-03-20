import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("MAX: ${model.getMax()}"),
        Text("MIN: ${model.getMin()}"),
        Text("AVG: ${model.getAvg().toStringAsFixed(3)}"),
        Text("90% bar: ${model.get90().toStringAsFixed(3)}"),
      ],
    );
  }
}
