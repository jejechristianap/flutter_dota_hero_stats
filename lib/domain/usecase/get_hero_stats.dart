import 'dart:developer';

import 'package:flutter_dota_hero_list/common/helper/use_case.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/data/repository/hero_repository_impl.dart';

class GetHeroStats extends UseCase<List<HeroStats>, NoParams> {
  final HeroRepositoryImpl repository;

  GetHeroStats(this.repository);

  @override
  Future<List<HeroStats>> call(NoParams param) async {
    log('GetHeroStats() call repository.getHeroStats');
    return await repository.getHeroStats();
  }
}
