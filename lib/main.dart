import 'package:flutter/material.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/pages/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Workout())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: Container(color: Colors.white, child: const HomePage()),
      ),
    );
  }
}
