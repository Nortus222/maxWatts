import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_watts/pages/HistoryPage.dart';
import 'package:max_watts/pages/HomePage.dart';
import 'package:max_watts/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget>? tabs;
  @override
  void initState() {
    super.initState();
    tabs = [const HomePage(), const HistoryPage()];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.archive)),
        ],
        backgroundColor: grey,
        activeColor: purple,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          onGenerateRoute: (settings) {
            return null;
          },
          builder: (context) {
            return CupertinoPageScaffold(child: tabs![index]);
          },
        );
      },
    );
  }
}
