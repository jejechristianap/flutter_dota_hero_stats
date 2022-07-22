import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/resource.dart';
import 'package:flutter_dota_hero_list/common/helper/use_case.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/usecase/filter_roles.dart';
import 'package:flutter_dota_hero_list/domain/usecase/get_hero_stats.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GetHeroStats _getHeroStats;
  final FilterRoles _filterRoles;

  HomeController(this._getHeroStats, this._filterRoles);

  Resource<List<HeroStats>?> _heroStats = Resource.loading();
  Resource<List<HeroStats>?> get heroStats => _heroStats;

  var selectedRoles = 0;
  var roleFiltered = ['All'].obs;
  var heroesFiltered = <HeroStats>[].obs;
  DateTime? currentBackPressTime;

  @override
  void onInit() {
    super.onInit();
    log('onInit getHeroStats');
    getHeroStats();
  }

  void getHeroStats() async {
    log('getHeroStats() loading');
    _heroStats = Resource.loading();
    update();
    try {
      final response = await _getHeroStats.call(NoParams());
      _heroStats = Resource.completed(response);
      log('getHeroStats() completed');
      heroesFiltered.addAll(heroStats.data!);
    } catch (e) {
      log('getHeroStats() error');
      _heroStats = Resource.error(e.toString());
    }
    update();
  }

  List getAllRoles() {
    final _heroStats = heroStats.data;
    List<dynamic> roles = ['All'];
    if (_heroStats != null) {
      for (var i in _heroStats) {
        roles.addAll(i.roles!);
      }
      roles.assignAll(roles.toSet().toList());
    }

    return roles;
  }

  void filterRoles(int index, bool onSelected) {
    final param = {
      'index': index,
      'onSelected': onSelected,
      'roles': getAllRoles(),
      'roleFiltered': roleFiltered,
      'heroes': heroStats.data
    };
    final filtered = _filterRoles.call(param);
    roleFiltered = filtered['roleFiltered'];
    heroesFiltered.clear();
    heroesFiltered.addAll(filtered['heroesFiltered']);
    update();
  }

  Map<String, Color?> getAttrColor(PrimaryAttr? attr) {
    if (attr == null) {
      return {'colorPrim': Colors.black};
    }
    switch (attr) {
      case PrimaryAttr.Agi:
        return {
          'colorPrime': Colors.green[800],
          'colorSecond': Colors.green[200]
        };
      case PrimaryAttr.Int:
        return {
          'colorPrime': Colors.blue[800],
          'colorSecond': Colors.blue[200]
        };
      case PrimaryAttr.Str:
        return {'colorPrime': Colors.red[800], 'colorSecond': Colors.red[200]};
    }
  }

  Future<bool> handleBackPress() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.snackbar(
        'Press again to exit',
        '',
        backgroundColor: AppColors.background,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }
}
