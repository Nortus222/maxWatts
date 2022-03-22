import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/theme.dart';

class Chart extends StatelessWidget {
  Workout workout;
  Chart(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: purple, width: 1),
          borderRadius: BorderRadius.circular(20)),
      child: LineChart(LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
            show: false,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                reservedSize: 22,
                getTextStyles: (context, value) =>
                    const TextStyle(color: Colors.black, fontSize: 14),
                showTitles: true,
                interval: 1,
                getTitles: (value) => value.toInt().toString(),
                margin: 12),
            leftTitles: SideTitles(
                getTextStyles: (context, value) =>
                    const TextStyle(color: Colors.black, fontSize: 14),
                showTitles: true,
                interval: 1,
                getTitles: (value) => value.toInt().toString(),
                margin: 12)),
        borderData: FlBorderData(show: false),
        minX: 0,
        minY: 0,
        maxX: workout.getSet().length + 3,
        maxY: workout.max + 100,
        extraLinesData: ExtraLinesData(horizontalLines: [
          HorizontalLine(
            y: workout.plank,
            strokeWidth: workout.plank == 0 ? 0 : 3,
            color: Colors.red,
          )
        ]),
        lineBarsData: [
          LineChartBarData(
              spots: workout
                  .getSet()
                  .asMap()
                  .entries
                  .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                  .toList(),
              isCurved: true,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false)),
        ],
      )),
    );
  }
}
