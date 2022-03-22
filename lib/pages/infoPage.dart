import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/widgets/appBar.dart';
import 'package:max_watts/widgets/chart.dart';
import 'package:max_watts/widgets/setWidget.dart';
import 'package:max_watts/widgets/statsWidget.dart';

class InfoPage extends StatelessWidget {
  Workout workout;
  InfoPage(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Scaffold(
        appBar: CustomAppBar(workout, false),
        body: Column(
          children: [
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: SetWidget(workout),
                  ),
                  Flexible(flex: 1, child: Stats(workout)),
                ],
              ),
            ),
            Flexible(flex: 1, child: Chart(workout)),
          ],
        ),
      ),
    );
  }
}
