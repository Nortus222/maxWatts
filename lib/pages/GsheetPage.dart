import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/scripts/credentials.dart';

class GsheetPage extends StatefulWidget {
  Workout workout;
  GsheetPage(this.workout, {Key? key}) : super(key: key);

  @override
  State<GsheetPage> createState() => _GsheetPageState();
}

class _GsheetPageState extends State<GsheetPage> {
  var gsheets;
  var spreadsheet;
  var sheet;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<bool> _loadCredentials() async {
    gsheets = GSheets(credentials);

    spreadsheet = await gsheets.spreadsheet(spreadsheetId);

    sheet = spreadsheet.worksheetByTitle('Ihor\'s Watts');

    return sheet == null;
  }

  void _updateSpreadsheet() async {
    await sheet.values.insertValue('new', column: 2, row: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: TextButton(
          onPressed: () {
            _updateSpreadsheet();
          },
          child: const Text("Update",
              style: TextStyle(
                color: Colors.white,
              ))),
    )));
  }
}
