import 'package:flutter_dota_hero_list/common/helper/use_case.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:get/get_rx/get_rx.dart';

class FilterRoles extends UseCaseF<Map<String, dynamic>, Map<String, dynamic>> {
  @override
  Map<String, dynamic> call(Map<String, dynamic> param) {
    num index = param['index'];
    bool onSelected = param['onSelected'];
    List<dynamic> roleFiltered = param['roleFiltered'];
    List<dynamic> roles = param['roles'];
    List<HeroStats> heroes = param['heroes'];
    List<HeroStats> heroesFiltered = [];

    if (onSelected) {
      if (index == 0) {
        roleFiltered.clear();
        roleFiltered.add(roles[0]);
      } else {
        if (roleFiltered.contains('All')) {
          roleFiltered.removeAt(0);
        }
        roleFiltered.add(roles[index.toInt()]);
      }
    } else {
      if (index == 0) {
        roleFiltered.removeAt(param['index']);
        roleFiltered.add(roles[1]);
      } else {
        if (roleFiltered.length == 1) {
          roleFiltered.add(roles[0]);
        }
        roleFiltered.removeWhere(
          (role) => role == roles[index.toInt()],
        );
      }
    }

    for (var i in heroes) {
      for (var j in roleFiltered) {
        if (j.toString().contains('All')) {
          heroesFiltered = List.from(heroes);
        } else if (i.roles!.toString().contains(j.toString())) {
          heroesFiltered.add(i);
        }
      }
    }
    heroesFiltered.assignAll(heroesFiltered.toSet().toList());
    return {'roleFiltered': roleFiltered, 'heroesFiltered': heroesFiltered};
  }
}
