import 'package:flutter/material.dart';
import 'package:max_watts/hiveModel.dart';
import 'package:max_watts/pages/GsheetSettingsPage.dart';
import 'package:max_watts/pages/HomePage.dart';
import 'package:max_watts/pages/UploadPage.dart';
import 'package:max_watts/pages/infoPage.dart';

class AppRouter {
  static const String mainRoute = "/";
  static const String infoRoute = "/info";
  static const String uploadRoute = "/upload";
  static const String settingsRoute = "/settings";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mainRoute:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const HomePage());
      case infoRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => InfoPage(settings.arguments as Workout));
      case uploadRoute:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => UploadPage(settings.arguments as Workout));
      case settingsRoute:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const GsheetSettingsPage());
      default:
        return MaterialPageRoute(
            builder: (_) => const Center(
                  child: Text("Unknown route"),
                ));
    }
  }
}
