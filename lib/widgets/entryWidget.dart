import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class Entry extends StatefulWidget {
  Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lastWorkout = Provider.of<WorkoutsController>(context).lastWorkout!;
    var workouts = Provider.of<WorkoutsController>(context);
    var timer = Provider.of<TimerController>(context);
    var listController =
        Provider.of<ListScrollController>(context).getController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text("${lastWorkout.length() + 1}) "),
            Flexible(
                flex: 2,
                child: TextFormField(
                    cursorColor: purple,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      fillColor: grey,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: purple),
                          borderRadius: BorderRadius.circular(20)),
                    ))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextButton(
              onPressed: () {
                workouts.lastAppend(int.parse(controller.text.trim()));
                timer.start();
                listController.scrollToIndex(
                  lastWorkout.length() - 1,
                  duration: const Duration(milliseconds: 500),
                );
                setState(() {
                  controller.clear();
                });
              },
              child:
                  Text("Enter", style: Theme.of(context).textTheme.titleSmall)),
        ),
      ],
    );
  }
}
