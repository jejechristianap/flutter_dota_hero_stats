import 'package:flutter_dota_hero_list/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    /// Get.put will Put immediately
    Get.put(SplashController());
  }
}
