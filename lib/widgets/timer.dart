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
      begin: Duration(minutes: 1),
      end: Duration(),
      builder: (time) {
        return Text(
          "${time.minutes}:${time.seconds}",
          style: TextStyle(fontSize: 24),
        );
      },
      stateBuilder: (time, state) {
        if (state == CustomTimerState.finished) {
          return Text("GO");
        }
        return null;
      },
      animationBuilder: (child) {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 250),
          child: child,
        );
      },
    );
  }
}
