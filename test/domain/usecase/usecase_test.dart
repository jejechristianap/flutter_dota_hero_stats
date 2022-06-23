import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/domain/usecase/filter_roles.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helper.dart';

void main() {
  group('Role Filtered', () {
    test(
        'Filtered Hero {onSelected = true, index = 1, role = [Carry, Support]} should contain 4 Heroes',
        () {
      var index = 1;
      var onSelected = true;

      List<dynamic> roleFiltered = ['Carry', 'Support'];

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

      expect(result.length, 4);
    });

    test(
        'Filtered Hero with {onSelected = false, index = 1, role = [All]} should return 5 Heroes',
        () {
      var index = 1;
      var onSelected = false;

      List<dynamic> roleFiltered = ['All'];

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

      expect(result.length, 5);
    });

    test(
        'Filtered Hero with {onSelected = false, index = 1, roles = []} should return 0 Hero',
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

    test(
        'Filtered Hero with {onSelected = false, index = 1} localizeName should return Hero1',
        () {
      var index = 1;
      var onSelected = true;

      List<dynamic> roleFiltered = ['Carry'];

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

      expect(result[0].localizedName, 'Hero1');
    });
  });
}
