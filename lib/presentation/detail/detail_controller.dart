import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/generator.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/data/model/attribute.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/usecase/get_similiar_heroes.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final GetSimiliarHeroes _getSimiliarHeroes;

  DetailController(this._getSimiliarHeroes);

  var heroStat = HeroStats();
  late List<HeroStats> heroesStat;
  List<HeroStats> similiarHeroes = [];
  List<HeroStats> selectedHeroes = [];
  var backStackPosition = 0.obs;

  @override
  void onInit() {
    super.onInit();
    log('selectedHeroes onInit: ${selectedHeroes.length}');
    final selectedHero = Get.parameters['selectedHero'];
    final heroes = Get.parameters['heroes'];
    if (selectedHero != null && heroes != null) {
      heroStat = heroStatFromJson(selectedHero);
      heroesStat = heroStatsFromJson(heroes);
      log('${selectedHeroes.length}');
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

  void updateSelectedHeroes(
      {required HeroStats hero, bool isBackPress = false}) {
    if (!isBackPress) {
      selectedHeroes.add(heroStat);
      backStackPosition.value++;
    }
    heroStat = hero;
    log('selectedHeroes: ${selectedHeroes.length}\nbackStackPosition: $backStackPosition');
    getSimiliarHeroes();
  }

  Future<bool> handleBackPress() async {
    if (backStackPosition > 0) {
      backStackPosition.value--;
      updateSelectedHeroes(
          hero: selectedHeroes[backStackPosition.value], isBackPress: true);
      return false;
    }
    return true;
  }

  List<Attribute> getAttribute() {
    return Generator.attribute(
      heroStat.attackType.toString().split('.').last,
      '${heroStat.baseAttackMin} - ${heroStat.baseAttackMax}',
      heroStat.baseHealth.toString(),
      heroStat.moveSpeed.toString(),
      heroStat.primaryAttr.toString().split('.').last,
    );
  }
}
