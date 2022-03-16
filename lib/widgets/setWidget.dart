import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';

class SetWidget extends StatelessWidget {
  const SetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Workout>(context);

    return SizedBox(
      height: 300,
      width: 250,
      child: ListView.builder(
          itemCount: model.getSize(),
          itemBuilder: (context, i) {
            return Card(
              child: Text("${i + 1}: ${model.set[i].toString()}"),
            );
          }),
    );
  }
}
