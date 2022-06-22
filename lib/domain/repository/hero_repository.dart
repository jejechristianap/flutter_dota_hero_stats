import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';

abstract class HeroRepository {
  Future<List<HeroStats>> getHeroStats();
}
