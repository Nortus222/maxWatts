import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';

class Entry extends StatefulWidget {
  Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutController>(context);
    var timer = Provider.of<TimerController>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text("${model.getSize() + 1}) "),
            SizedBox(
                width: 100,
                child: TextFormField(
                  controller: controller,
                )),
          ],
        ),
        TextButton(
            onPressed: () {
              model.append(int.parse(controller.text.trim()));
              timer.start();
              setState(() {
                controller.clear();
              });
            },
            child: Text("Enter")),
      ],
    );
  }
}
