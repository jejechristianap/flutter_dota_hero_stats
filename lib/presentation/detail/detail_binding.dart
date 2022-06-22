import 'package:flutter_dota_hero_list/domain/usecase/get_similiar_heroes.dart';
import 'package:flutter_dota_hero_list/presentation/detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetSimiliarHeroes());
    Get.put(DetailController(Get.find()));
  }
}
