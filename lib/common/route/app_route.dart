import 'package:flutter_dota_hero_list/presentation/detail/detail_binding.dart';
import 'package:flutter_dota_hero_list/presentation/detail/detail_page.dart';
import 'package:flutter_dota_hero_list/presentation/home/home_binding.dart';
import 'package:flutter_dota_hero_list/presentation/home/home_page.dart';
import 'package:flutter_dota_hero_list/presentation/splash/splash_page.dart';
import 'package:get/get.dart';

import '../constant/route_constant.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: RouteConstant.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteConstant.home,
      binding: HomeBinding(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteConstant.detail,
      binding: DetailBinding(),
      page: () => const DetailPage(),
    )
  ];
}
