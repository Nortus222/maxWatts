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
              begin: const Duration(minutes: 1),
              end: const Duration(),
              builder: (time) {
                return Text(
                  "${time.minutes}:${time.seconds}",
                  style: const TextStyle(fontSize: 24),
                );
              },
              stateBuilder: (time, state) {
                if (state == CustomTimerState.finished) {
                  return const Text("GO");
                }
                return null;
              },
              animationBuilder: (child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: child,
                );
              },
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
