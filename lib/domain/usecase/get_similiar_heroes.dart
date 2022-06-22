import 'dart:developer';

import 'package:flutter_dota_hero_list/common/helper/use_case.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';

class GetSimiliarHeroes
    extends UseCaseF<List<HeroStats>, Map<String, dynamic>> {
  @override
  List<HeroStats> call(Map<String, dynamic> param) {
    List<HeroStats> heroes = param['heroes'];
    List<HeroStats> similiarAttr = [];
    List<HeroStats> topThree = [];
    PrimaryAttr primeAttr = param['primaryAttr'];
    String name = param['localizedName'];

    /// Filtered heroes based on primaryAttr
    for (var i in heroes) {
      if (i.primaryAttr == primeAttr) {
        if (i.localizedName != null) {
          if (!i.localizedName!.contains(name)) {
            similiarAttr.add(i);
          }
        }
      }
    }

    switch (primeAttr) {
      case PrimaryAttr.Agi:
        similiarAttr.sort((a, b) => a.moveSpeed!.compareTo(b.moveSpeed!));
        break;
      case PrimaryAttr.Int:
        similiarAttr.sort((a, b) => a.baseMana!.compareTo(b.baseMana!));
        break;
      case PrimaryAttr.Str:
        similiarAttr
            .sort((a, b) => a.baseAttackMax!.compareTo(b.baseAttackMax!));
        break;
    }

    var truncate =
        similiarAttr.sublist(similiarAttr.length - 3, similiarAttr.length);

    for (var i in truncate.reversed) {
      log("truncate ===========\n${i.localizedName} : Agi ${i.moveSpeed} : Int ${i.baseMana} : baseAttackMax ${i.baseAttackMax}");
      topThree.add(i);
    }
    return topThree;
  }
}
