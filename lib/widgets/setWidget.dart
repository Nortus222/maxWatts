import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SetWidget extends StatelessWidget {
  const SetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<WorkoutController>(context);
    AutoScrollController controller =
        Provider.of<ListScrollController>(context).getController();

    return SizedBox(
      child: ListView.builder(
          controller: controller,
          itemCount: model.getSize(),
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
                            child: Text(model.getSet()[i].toString()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onDismissed: (direction) {
                model.remove(i);
              },
              confirmDismiss: (direction) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Are you sure?"),
                        content:
                            Text("Are you shure you want to delete this item?"),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text(
                                  "Cancel",
                                  style: Theme.of(context).textTheme.titleSmall,
                                )),
                          ),
                          TextButton(
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.red)),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: Text(
                                "Yes",
                                style: Theme.of(context).textTheme.titleSmall,
                              ))
                        ],
                      );
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
