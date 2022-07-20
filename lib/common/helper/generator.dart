import 'package:flutter_dota_hero_list/data/model/attribute.dart';

class Generator {
  static List<Attribute> attribute(
      String type, String atk, String health, String mspd, String attr) {
    List<Attribute> attrList = [];
    attrList.add(Attribute(title: 'Type', value: type));
    attrList.add(Attribute(title: 'Max Atk', value: atk));
    attrList.add(Attribute(title: 'Healt', value: health));
    attrList.add(Attribute(title: 'MSPD', value: mspd));
    attrList.add(Attribute(title: 'Attr', value: attr));
    return attrList;
  }
}
