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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: size.height / 3,
                child: Row(
                  children: const [
                    Flexible(
                      flex: 2,
                      child: SetWidget(),
                    ),
                    Flexible(flex: 1, child: Stats()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Entry(),
              ),
              Timer(),
              Expanded(
                  child:
                      Chart(Provider.of<WorkoutController>(context).workout!)),
            ],
          ),
        ),
      ),
    );
  }
}
