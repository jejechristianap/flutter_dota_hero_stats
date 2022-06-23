import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';

class TestHelper {
  static List<dynamic> roles = [
    /// 0
    'All',

    /// 1
    'Carry',

    /// 2

    'Escape',

    /// 3
    'Nuker',

    /// 4
    'Initiator',

    /// 5
    'Durable',

    /// 6
    'Disabler',

    /// 7
    'Jungler',

    /// 8
    'Support',

    /// 9
    'Pusher'
  ];
  static List<HeroStats> heroes = [
    HeroStats(
      localizedName: 'Hero1',
      roles: ['Carry', 'Escape', 'Pusher'],
    ),
    HeroStats(
      localizedName: 'Hero2',
      roles: ['Support', 'Disabler'],
    ),
    HeroStats(
      localizedName: 'Hero3',
      roles: ['Carry', 'Nuker', 'Pusher'],
    ),
    HeroStats(
      localizedName: 'Hero4',
      roles: ['All', 'Carry', 'Nuker', 'Support'],
    ),
    HeroStats(
      localizedName: 'Hero5',
      roles: ['Disabler', 'Pusher'],
    ),
  ];
}
