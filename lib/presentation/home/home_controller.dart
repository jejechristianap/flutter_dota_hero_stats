import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/resource.dart';
import 'package:flutter_dota_hero_list/common/helper/use_case.dart';
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

  @override
  void onInit() {
    super.onInit();
    getHeroStats();
  }

  void getHeroStats() async {
    _heroStats = Resource.loading();
    update();
    try {
      _heroStats = Resource.completed(await _getHeroStats.call(NoParams()));
      heroesFiltered.addAll(heroStats.data!);
    } catch (e) {
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
}
