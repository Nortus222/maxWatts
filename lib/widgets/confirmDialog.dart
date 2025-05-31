import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      content: const Text("Are you shure you want to delete this item?"),
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
                foregroundColor: WidgetStateProperty.all(Colors.red)),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              "Yes",
              style: Theme.of(context).textTheme.titleSmall,
            ))
      ],
    );
  }
}
