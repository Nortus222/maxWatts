import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:provider/provider.dart';
import 'package:max_watts/model.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTimerController controller =
        Provider.of<TimerController>(context).getController();

    //TODO add controlls
    return CustomTimer(
      controller: controller,
      builder: (state, time) {
        Text child;

        switch (state) {
          case CustomTimerState.reset:
            child = Text(
              "00:00",
              style: TextStyle(fontSize: 24),
            );
            break;
          case CustomTimerState.paused:
            child = Text(
              "${time.minutes}:${time.seconds.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 24),
            );
            break;
          case CustomTimerState.counting:
            child = Text(
              "${time.minutes}:${time.seconds.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 24),
            );
            break;
          case CustomTimerState.finished:
            child = Text(
              "GO",
              style: TextStyle(fontSize: 24),
            );
            break;
        }

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: child,
        );
      },
    );
  }
}
