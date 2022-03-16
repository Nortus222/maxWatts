import 'package:flutter/material.dart';
import 'package:max_watts/widgets/entryWidget.dart';
import 'package:max_watts/widgets/setWidget.dart';
import 'package:max_watts/widgets/statsWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              SetWidget(),
              Stats(),
            ],
          ),
          Entry(),
        ],
      ),
    ));
  }
}
