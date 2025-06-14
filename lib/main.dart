import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/model.dart';
import 'package:max_watts/pages/mainPage.dart';
import 'package:max_watts/router.dart';
import 'package:max_watts/theme.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WorkoutAdapter());
  await Hive.openBox<Workout>(WORKOUTS);
  await Hive.openBox<String>(GSHEETSETTINGS);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TimerController(this)),
        ChangeNotifierProvider.value(value: ListScrollController()),
        ChangeNotifierProvider.value(value: WorkoutsController()),
        ChangeNotifierProvider.value(value: GsheetController()),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: "/",
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme,
        home: Container(color: Colors.white, child: const MainPage()),
      ),
    );
  }
}
