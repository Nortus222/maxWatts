import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/pages/GsheetPage.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  Workout workout;
  bool isHomePage;
  CustomAppBar(this.workout, this.isHomePage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutsController>(context);
    var timer = Provider.of<TimerController>(context);
    var format = DateFormat.yMMMMd('en_US');

    return AppBar(
      title: Text(format.format(workout.date!).toString()),
      actions: isHomePage == true
          ? [
              IconButton(
                icon: const Icon(Icons.add),
                color: purple,
                onPressed: () {
                  model.add();
                  timer.reset();
                },
              )
            ]
          : [
              IconButton(
                icon: const Icon(Icons.upload),
                color: purple,
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return GsheetPage(workout);
                  }));
                },
              )
            ],
      leading: isHomePage == false
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: purple,
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
