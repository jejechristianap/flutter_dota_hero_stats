import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dota_hero_list/di/dependency.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/home_mvvm/home_test_page.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/view.dart';

import 'presentation/my_app.dart';

void main() {
  Dependency.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
  //runApp(const AppTest());
}

class AppTest extends StatelessWidget {
  const AppTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorObservers: [routeObserver],
      home: HomeTestPage(),
    );
  }
}
