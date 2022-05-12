import 'package:app/ui/bug_page.dart';
import 'package:app/ui/driver_page.dart';
import 'package:app/ui/feature_page.dart';
import 'package:app/ui/rate_page.dart';
import 'package:app/ui/route_page.dart';
import 'package:app/ui/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/route': (context) => const RoutePage(),
        '/driver': (context) => const DriverPage(),
        '/settings': (context) => const SettingsPage(),
        '/bug': (context) => const BugPage(),
        '/feature': (context) => const FeaturePage(),
        '/rate': (context) => const RatePage(),
      },
    );
  }
}
