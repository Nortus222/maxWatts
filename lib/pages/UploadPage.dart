import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/pages/GsheetSettingsPage.dart';
import 'package:max_watts/scripts/credentials.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class UploadPage extends StatefulWidget {
  Workout workout;

  UploadPage(this.workout, {Key? key}) : super(key: key);

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<bool> _loadCredentials() async {
    return Provider.of<GsheetController>(context, listen: false)
        .loadCredentials();
  }

  DateFormat format = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Upload"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  color: purple,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const GsheetSettingsPage();
                    }));
                  },
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder(
                  future: _loadCredentials(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData && snapshot.data!) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Date: "),
                                TextButton(
                                  child:
                                      Text(format.format(widget.workout.date!)),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.transparent),
                                  ),
                                  onPressed: () {
                                    DatePicker.showDatePicker(
                                      context,
                                      showTitleActions: true,
                                      onConfirm: (date) {
                                        widget.workout.date = date;
                                        Provider.of<WorkoutsController>(context,
                                                listen: false)
                                            .updateDate(widget.workout);
                                        setState(() {});
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextButton(
                                child: Text(
                                  "Upload",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                onPressed: () {
                                  Provider.of<GsheetController>(context,
                                          listen: false)
                                      .upload(widget.workout);
                                },
                              ),
                            )
                          ],
                        );
                      } else if (snapshot.hasData && !snapshot.data!) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                  "You need to set up credentials first"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return const GsheetSettingsPage();
                                    }));
                                  },
                                  child: Text(
                                    "Set Up",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ))
                            ],
                          ),
                        );
                      } else {
                        return Center(child: Text(snapshot.error.toString()));
                      }
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                        color: purple,
                      ));
                    }
                  }),
            )));
  }
}
