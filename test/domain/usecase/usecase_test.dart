import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/usecase/filter_roles.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helper.dart';

void main() {
  group('Role Filtered', () {
    test('Filtered Hero {onSelected = true, index = 1} should contain 3 Heroes',
        () {
      var index = 1;
      var onSelected = true;

      List<dynamic> roleFiltered = [];

      final param = {
        'index': index,
        'onSelected': onSelected,
        'roles': TestHelper.roles,
        'roleFiltered': roleFiltered,
        'heroes': TestHelper.heroes
      };

      final useCase = FilterRoles();
      final filtered = useCase.call(param);
      List<HeroStats> result = filtered['heroesFiltered'];

      expect(result.length, 3);
    });

    test(
        'Filtered Hero with {onSelected = false, index = 1} should return 0 Hero',
        () {
      var index = 1;
      var onSelected = false;

      List<dynamic> roleFiltered = [];

      final param = {
        'index': index,
        'onSelected': onSelected,
        'roles': TestHelper.roles,
        'roleFiltered': roleFiltered,
        'heroes': TestHelper.heroes
      };

      final useCase = FilterRoles();
      final filtered = useCase.call(param);
      List<HeroStats> result = filtered['heroesFiltered'];

      expect(result.length, 0);
    });
  });
}
