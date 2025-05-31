import 'package:flutter/material.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:provider/provider.dart';
import 'package:max_watts/model.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    CustomTimerController controller =
        Provider.of<TimerController>(context).getController();

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: CustomTimer(
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
      }
              ),
          ),
        ),
        IconButton(
            onPressed: () {
              switch (controller.state) {
                case CustomTimerState.paused:
                  controller.start();
                  break;
                case CustomTimerState.counting:
                  controller.pause();
                  break;
                case CustomTimerState.finished:
                  controller.reset();
                  controller.start();
                  break;
                case CustomTimerState.reset:
                  controller.start();
                  break;
                default:
                  break;
              }
              setState(() {});
            },
            icon: controller.state == CustomTimerState.counting
                ? const Icon(Icons.pause_circle_filled)
                : const Icon(Icons.play_circle_filled)),
        IconButton(
            onPressed: () {
              controller.reset();
              setState(() {});
            },
            icon: const Icon(Icons.replay_circle_filled)),
      ],
    );
  }
}
