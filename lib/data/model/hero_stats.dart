/// To parse this JSON data, do
///
/// final heroStats = heroStatsFromJson(jsonString);
/// Generated with "https://app.quicktype.io/"
import 'dart:convert';

List<HeroStats> heroStatsFromJson(String str) =>
    List<HeroStats>.from(json.decode(str).map((x) => HeroStats.fromJson(x)));

String heroStatsToJson(List<HeroStats> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

HeroStats heroStatFromJson(String str) => HeroStats.fromJson(json.decode(str));

String heroStatToJson(HeroStats data) => json.encode(data.toJson());

// ignore_for_file: constant_identifier_names
class HeroStats {
  HeroStats({
    this.id,
    this.name,
    this.localizedName,
    this.primaryAttr,
    this.attackType,
    this.roles,
    this.img,
    this.icon,
    this.baseHealth,
    this.baseHealthRegen,
    this.baseMana,
    this.baseManaRegen,
    this.baseArmor,
    this.baseMr,
    this.baseAttackMin,
    this.baseAttackMax,
    this.baseStr,
    this.baseAgi,
    this.baseInt,
    this.strGain,
    this.agiGain,
    this.intGain,
    this.attackRange,
    this.projectileSpeed,
    this.attackRate,
    this.moveSpeed,
    this.turnRate,
    this.cmEnabled,
    this.legs,
    this.heroId,
    this.turboPicks,
    this.turboWins,
    this.proBan,
    this.proWin,
    this.proPick,
    this.the1Pick,
    this.the1Win,
    this.the2Pick,
    this.the2Win,
    this.the3Pick,
    this.the3Win,
    this.the4Pick,
    this.the4Win,
    this.the5Pick,
    this.the5Win,
    this.the6Pick,
    this.the6Win,
    this.the7Pick,
    this.the7Win,
    this.the8Pick,
    this.the8Win,
    this.nullPick,
    this.nullWin,
  });

  int? id;
  String? name;
  String? localizedName;
  PrimaryAttr? primaryAttr;
  AttackType? attackType;
  List<dynamic>? roles;
  String? img;
  String? icon;
  num? baseHealth;
  num? baseHealthRegen;
  num? baseMana;
  num? baseManaRegen;
  num? baseArmor;
  num? baseMr;
  num? baseAttackMin;
  num? baseAttackMax;
  num? baseStr;
  num? baseAgi;
  int? baseInt;
  num? strGain;
  num? agiGain;
  num? intGain;
  num? attackRange;
  num? projectileSpeed;
  num? attackRate;
  num? moveSpeed;
  num? turnRate;
  bool? cmEnabled;
  num? legs;
  num? heroId;
  num? turboPicks;
  num? turboWins;
  num? proBan;
  num? proWin;
  num? proPick;
  num? the1Pick;
  num? the1Win;
  num? the2Pick;
  num? the2Win;
  num? the3Pick;
  num? the3Win;
  num? the4Pick;
  num? the4Win;
  num? the5Pick;
  num? the5Win;
  num? the6Pick;
  num? the6Win;
  num? the7Pick;
  num? the7Win;
  num? the8Pick;
  num? the8Win;
  num? nullPick;
  num? nullWin;

  factory HeroStats.fromJson(Map<String, dynamic> json) => HeroStats(
        id: json["id"],
        name: json["name"],
        localizedName: json["localized_name"],
        primaryAttr: json["primary_attr"] == null
            ? null
            : primaryAttrValues.map?[json["primary_attr"]],
        attackType: json["attack_type"] == null
            ? null
            : attackTypeValues.map?[json["attack_type"]],
        roles: json["roles"] == null
            ? null
            : List<dynamic>.from(json["roles"].map((x) => x)),
        img: json["img"],
        icon: json["icon"],
        baseHealth: json["base_health"],
        baseHealthRegen: json["base_health_regen"],
        baseMana: json["base_mana"],
        baseManaRegen: json["base_mana_regen"],
        baseArmor: json["base_armor"],
        baseMr: json["base_mr"],
        baseAttackMin: json["base_attack_min"],
        baseAttackMax: json["base_attack_max"],
        baseStr: json["base_str"],
        baseAgi: json["base_agi"],
        baseInt: json["base_int"],
        strGain: json["str_gain"],
        agiGain: json["agi_gain"],
        intGain: json["int_gain"],
        attackRange: json["attack_range"],
        projectileSpeed: json["projectile_speed"],
        attackRate: json["attack_rate"],
        moveSpeed: json["move_speed"],
        turnRate: json["turn_rate"],
        cmEnabled: json["cm_enabled"],
        legs: json["legs"],
        heroId: json["hero_id"],
        turboPicks: json["turbo_picks"],
        turboWins: json["turbo_wins"],
        proBan: json["pro_ban"],
        proWin: json["pro_win"],
        proPick: json["pro_pick"],
        the1Pick: json["1_pick"],
        the1Win: json["1_win"],
        the2Pick: json["2_pick"],
        the2Win: json["2_win"],
        the3Pick: json["3_pick"],
        the3Win: json["3_win"],
        the4Pick: json["4_pick"],
        the4Win: json["4_win"],
        the5Pick: json["5_pick"],
        the5Win: json["5_win"],
        the6Pick: json["6_pick"],
        the6Win: json["6_win"],
        the7Pick: json["7_pick"],
        the7Win: json["7_win"],
        the8Pick: json["8_pick"],
        the8Win: json["8_win"],
        nullPick: json["null_pick"],
        nullWin: json["null_win"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "localized_name": localizedName,
        "primary_attr": primaryAttr == null
            ? null
            : primaryAttrValues.reverse?[primaryAttr],
        "attack_type":
            attackType == null ? null : attackTypeValues.reverse?[attackType],
        "roles":
            roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
        "img": img,
        "icon": icon,
        "base_health": baseHealth,
        "base_health_regen": baseHealthRegen,
        "base_mana": baseMana,
        "base_mana_regen": baseManaRegen,
        "base_armor": baseArmor,
        "base_mr": baseMr,
        "base_attack_min": baseAttackMin,
        "base_attack_max": baseAttackMax,
        "base_str": baseStr,
        "base_agi": baseAgi,
        "base_int": baseInt,
        "str_gain": strGain,
        "agi_gain": agiGain,
        "int_gain": intGain,
        "attack_range": attackRange,
        "projectile_speed": projectileSpeed,
        "attack_rate": attackRate,
        "move_speed": moveSpeed,
        "turn_rate": turnRate,
        "cm_enabled": cmEnabled,
        "legs": legs,
        "hero_id": heroId,
        "turbo_picks": turboPicks,
        "turbo_wins": turboWins,
        "pro_ban": proBan,
        "pro_win": proWin,
        "pro_pick": proPick,
        "1_pick": the1Pick,
        "1_win": the1Win,
        "2_pick": the2Pick,
        "2_win": the2Win,
        "3_pick": the3Pick,
        "3_win": the3Win,
        "4_pick": the4Pick,
        "4_win": the4Win,
        "5_pick": the5Pick,
        "5_win": the5Win,
        "6_pick": the6Pick,
        "6_win": the6Win,
        "7_pick": the7Pick,
        "7_win": the7Win,
        "8_pick": the8Pick,
        "8_win": the8Win,
        "null_pick": nullPick,
        "null_win": nullWin,
      };
}

enum AttackType { Melee, Ranged }

final attackTypeValues =
    EnumValues({"Melee": AttackType.Melee, "Ranged": AttackType.Ranged});

enum PrimaryAttr { Agi, Str, Int }

final primaryAttrValues = EnumValues(
    {"agi": PrimaryAttr.Agi, "int": PrimaryAttr.Int, "str": PrimaryAttr.Str});

enum Role {
  All,
  Carry,
  Escape,
  Nuker,
  Initiator,
  Durable,
  Disabler,
  Jungler,
  Support,
  Pusher
}

final roleValues = EnumValues({
  "Carry": Role.Carry,
  "Disabler": Role.Disabler,
  "Durable": Role.Durable,
  "Escape": Role.Escape,
  "Initiator": Role.Initiator,
  "Jungler": Role.Jungler,
  "Nuker": Role.Nuker,
  "Pusher": Role.Pusher,
  "Support": Role.Support
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map?.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
