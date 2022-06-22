import 'dart:developer';

import 'package:flutter_dota_hero_list/common/constant/route_constant.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    log('session start...');
    startSession();
  }

  startSession() async {
    await 2.delay();
    Get.offNamed(RouteConstant.home);
  }
}
