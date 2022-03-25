import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/widgets/appBar.dart';
import 'package:max_watts/widgets/chart.dart';
import 'package:max_watts/widgets/entryWidget.dart';
import 'package:max_watts/widgets/setWidget.dart';
import 'package:max_watts/widgets/statsWidget.dart';
import 'package:max_watts/widgets/timer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var lastWorkout = Provider.of<WorkoutsController>(context).lastWorkout!;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(lastWorkout, true),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: SetWidget(lastWorkout),
                      ),
                      Flexible(flex: 1, child: Stats(lastWorkout)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Entry(),
                ),
                const Timer(),
                Expanded(child: Chart(lastWorkout)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
