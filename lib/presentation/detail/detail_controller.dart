import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/usecase/get_similiar_heroes.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetSimiliarHeroes _getSimiliarHeroes;

  DetailController(this._getSimiliarHeroes);

  var heroStat = HeroStats();
  late List<HeroStats> heroesStat;
  List<HeroStats> similiarHeroes = [];

  @override
  void onInit() {
    super.onInit();
    final selectedHero = Get.parameters['selectedHero'];
    final heroes = Get.parameters['heroes'];
    if (selectedHero != null && heroes != null) {
      heroStat = heroStatFromJson(selectedHero);
      heroesStat = heroStatsFromJson(heroes);
      getSimiliarHeroes();
    } else {
      Get.snackbar(
        'Oopss',
        'Something went wrong, please try again',
        backgroundColor: AppColors.background,
        colorText: Colors.white,
        margin: const EdgeInsets.all(24),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void getSimiliarHeroes() {
    final param = {
      'heroes': heroesStat,
      'primaryAttr': heroStat.primaryAttr,
      'localizedName': heroStat.localizedName
    };
    similiarHeroes = _getSimiliarHeroes.call(param);
    similiarHeroes.reversed;
    update();
  }
}
