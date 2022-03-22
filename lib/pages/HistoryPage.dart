import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/pages/infoPage.dart';
import 'package:max_watts/widgets/confirmDialog.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutsController>(context);

    var format = DateFormat.yMMMMd('en_US');

    return SafeArea(
      minimum: const EdgeInsets.all(10),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("History"),
        ),
        body: ListView.builder(
            itemCount: model.workouts!.length,
            itemBuilder: (context, i) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: ListTile(
                    title: Text(format.format(model.workouts![i].date!)),
                    subtitle: Text(
                        "MAX: ${model.workouts![i].max} MIN: ${model.workouts![i].min} AVG: ${model.workouts![i].avg.toStringAsFixed(1)}"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return InfoPage(model.workouts![i]);
                        },
                      ));
                    },
                  ),
                ),
                onDismissed: (direction) {
                  model.remove(i);
                },
                confirmDismiss: (direction) {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ConfirmDialog();
                      });
                },
                background: Container(
                  child: const Icon(
                    Icons.delete,
                    size: 25,
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red),
                ),
              );
            }),
      ),
    );
  }
}
