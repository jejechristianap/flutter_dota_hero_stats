import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/constant/constant.dart';
import 'package:flutter_dota_hero_list/common/constant/route_constant.dart';
import 'package:flutter_dota_hero_list/common/route/app_route.dart';
import 'package:flutter_dota_hero_list/common/styles/app_theme.dart';
import 'package:flutter_dota_hero_list/presentation/splash/splash_binding.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constant.appName,
      theme: AppTheme.main,
      getPages: AppRoute.routes,
      initialRoute: RouteConstant.splash,
      initialBinding: SplashBinding(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Platform.isIOS ? Transition.native : Transition.zoom,
      transitionDuration:
          Platform.isIOS ? null : const Duration(milliseconds: 300),
    );
  }
}
