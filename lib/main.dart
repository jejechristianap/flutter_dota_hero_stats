import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dota_hero_list/di/dependency.dart';

import 'presentation/my_app.dart';

void main() {
  Dependency.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
