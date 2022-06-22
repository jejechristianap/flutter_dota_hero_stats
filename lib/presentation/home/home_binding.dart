import 'package:flutter_dota_hero_list/data/repository/hero_repository_impl.dart';
import 'package:flutter_dota_hero_list/domain/usecase/filter_roles.dart';
import 'package:flutter_dota_hero_list/domain/usecase/get_hero_stats.dart';
import 'package:flutter_dota_hero_list/presentation/home/home_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HeroRepositoryImpl(Get.find()));
    Get.lazyPut(() => GetHeroStats(Get.find()));
    Get.lazyPut(() => FilterRoles());
    Get.put(HomeController(Get.find(), Get.find()));
  }
}
