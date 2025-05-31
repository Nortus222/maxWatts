import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/theme.dart';

class Chart extends StatelessWidget {
  final Workout workout;
  const Chart(this.workout, {Key? key}) : super(key: key);

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
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 22,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    workout.getSet()[value.toInt()].toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                  ),
                );
              },
              showTitles: true,
              interval: 1,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              getTitlesWidget: (value, meta) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  value.toInt().toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ),
              showTitles: true,
              interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        minY: workout.min - 100,
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
