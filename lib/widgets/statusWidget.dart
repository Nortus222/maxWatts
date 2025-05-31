import 'package:flutter/material.dart';
import 'package:max_watts/widgets/credentialsDialog.dart';

class StatusWidget extends StatelessWidget {
  String? data;
  bool showData;
  String field;
  StatusWidget(this.data, this.showData, this.field, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        showData
            ? data != null
                ? TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CredentialsDialog(data, field);
                          });
                    },
                    style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(150, 80)),
                        minimumSize:
                            WidgetStateProperty.all(const Size(100, 50)),
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent)),
                    child: Text(data!.trim()),
                  )
                : const Icon(
                    Icons.error,
                    color: Colors.red,
                  )
            : data != null
                ? const Icon(
                    Icons.done,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
        showData
            ? data != null
                ? Container()
                : TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CredentialsDialog(data, field);
                          });
                    },
                    style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            WidgetStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent)),
                    child: const Text("edit"),
                  )
            : data != null
                ? TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CredentialsDialog(data, field);
                          });
                    },
                    style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            WidgetStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent)),
                    child: const Text("edit"),
                  )
                : TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CredentialsDialog(data, field);
                          });
                    },
                    style: ButtonStyle(
                        textStyle: WidgetStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            WidgetStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            WidgetStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent)),
                    child: const Text("Enter"),
                  )
      ],
    );
  }
}
