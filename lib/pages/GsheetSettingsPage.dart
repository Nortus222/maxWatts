import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/widgets/statusWidget.dart';
import 'package:provider/provider.dart';

class GsheetSettingsPage extends StatelessWidget {
  const GsheetSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<GsheetController>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("GSheet Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Account Credentials: "),
                StatusWidget(model.credentials, false, CREDENTIALS),
              ],
            ),
            Row(
              children: [
                const Text("Spreadsheet ID: "),
                StatusWidget(model.spreadsheetId, false, SPREADSHEETID),
              ],
            ),
            Row(
              children: [
                const Text("Worksheet Title: "),
                StatusWidget(model.worksheetTitle, true, WORKSHEETTITLE),
              ],
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Done",
                  style: Theme.of(context).textTheme.titleSmall,
                ))
          ],
        ),
      ),
    ));
  }
}
