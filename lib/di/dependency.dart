import 'package:flutter_dota_hero_list/common/service/api_service.dart';
import 'package:flutter_dota_hero_list/data/repository/hero_repository_impl.dart';
import 'package:get/get.dart';

class Dependency {
  static init() {
    /// Get.lazyPut will Put when you need it
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => HeroRepositoryImpl(Get.find()));
  }
}
