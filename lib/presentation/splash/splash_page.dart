import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/constant/asset_constant.dart';
import 'package:flutter_dota_hero_list/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) => Scaffold(
        body: Container(
          color: Colors.black,
          child: Center(
            child: Image.asset(
              AssetConstant.icLogo,
            ),
          ),
        ),
      ),
    );
  }
}
