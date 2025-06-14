import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';

class Entry extends StatefulWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                      cursorColor: purple,
                      controller: controller,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a value";
                        }

                        final number = int.tryParse(value);

                        if (number == null) {
                          return "Enter an integer";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: grey,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purple),
                            borderRadius: BorderRadius.circular(20)),
                      )),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  workouts.lastAppend(int.parse(controller.text.trim()));
                  timer.reset();
                  timer.start();
                  listController.scrollToIndex(
                    lastWorkout.length() - 1,
                    duration: const Duration(milliseconds: 500),
                  );
                  setState(() {
                    controller.clear();
                  });
                }
              },
              child:
                  Text("Enter", style: Theme.of(context).textTheme.titleSmall)),
        ),
      ],
    );
  }
}
