import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:provider/provider.dart';
import 'package:max_watts/model.dart';

class Timer extends StatelessWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountdownTimerController controller =
        Provider.of<TimerController>(context).getController();

    return CountdownTimer(
      controller: controller,
    );
  }
}
