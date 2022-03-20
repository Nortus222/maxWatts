import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';

class SetWidget extends StatelessWidget {
  const SetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutController>(context);

    return SizedBox(
      height: 300,
      width: 250,
      child: ListView.builder(
          itemCount: model.getSize(),
          itemBuilder: (context, i) {
            return ListTile(
              leading: Text("${i + 1}:", style: TextStyle(fontSize: 24)),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.getSet()[i].toString(),
                    style: TextStyle(fontSize: 24)),
              ),
            );
          }),
    );
  }
}
