import 'package:flutter_dota_hero_list/common/constant/api_constant.dart';
import 'package:flutter_dota_hero_list/common/service/api_service.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/repository/hero_repository.dart';

class HeroRepositoryImpl implements HeroRepository {
  final ApiService apiService;

  HeroRepositoryImpl(this.apiService);

  @override
  Future<List<HeroStats>> getHeroStats() async {
    final response = await apiService.get(endPoint: ApiConstant.heroStats);
    return (response.data as List).map((x) => HeroStats.fromJson(x)).toList();
  }
}
