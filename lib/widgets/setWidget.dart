import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/widgets/confirmDialog.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SetWidget extends StatelessWidget {
  Workout workout;
  SetWidget(this.workout, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var workouts = Provider.of<WorkoutsController>(context);
    AutoScrollController controller =
        Provider.of<ListScrollController>(context).getController();

    return SizedBox(
      child: ListView.builder(
          controller: controller,
          itemCount: workout.length(),
          itemBuilder: (context, i) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              child: AutoScrollTag(
                key: ValueKey(i),
                index: i,
                controller: controller,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("${i + 1}:"),
                        Expanded(
                          child: Center(
                            child: Text(workout.getSet()[i].toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onDismissed: (direction) {
                workouts.lastRemove(i);
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
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
              ),
            );
          }),
    );
  }
}
