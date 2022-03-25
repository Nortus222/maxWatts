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
                    child: Text(data!.trim()),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            MaterialStateProperty.all(const Size(150, 80)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(100, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
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
                    child: const Text("edit"),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            MaterialStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
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
                    child: const Text("edit"),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            MaterialStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                  )
                : TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CredentialsDialog(data, field);
                          });
                    },
                    child: const Text("Enter"),
                    style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 18)),
                        maximumSize:
                            MaterialStateProperty.all(const Size(100, 80)),
                        minimumSize:
                            MaterialStateProperty.all(const Size(50, 50)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                  )
      ],
    );
  }
}
