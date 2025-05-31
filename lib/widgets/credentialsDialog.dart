import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';

class CredentialsDialog extends StatelessWidget {
  String? data;
  String field;
  CredentialsDialog(this.data, this.field, {Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = data ?? '';

    return AlertDialog(
      title: const Text("Enter"),
      content: TextFormField(
          maxLines: 10,
          minLines: 1,
          cursorColor: purple,
          controller: controller,
          decoration: InputDecoration(
            fillColor: grey,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: purple),
                borderRadius: BorderRadius.circular(20)),
          )),
      actions: [
        TextButton(
          child: Text(
            "Save",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          onPressed: () {
            Provider.of<GsheetController>(context, listen: false)
                .updateCredentials(controller.text.trim(), field);
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
