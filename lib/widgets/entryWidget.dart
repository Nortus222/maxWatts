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
    var model = Provider.of<WorkoutController>(context);
    var timer = Provider.of<TimerController>(context);
    var listController =
        Provider.of<ListScrollController>(context).getController();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text("${model.getSize() + 1}) "),
            Flexible(
                flex: 2,
                child: TextFormField(
                    cursorColor: purple,
                    controller: controller,
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
                model.append(int.parse(controller.text.trim()));
                timer.start();
                listController.scrollToIndex(
                  model.getSize() - 1,
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
