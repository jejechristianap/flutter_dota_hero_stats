import 'package:flutter_dota_hero_list/common/constant/api_constant.dart';

class Helper {
  static String getUrlImage(String? image) {
    return '${ApiConstant.baseImageUrl}$image';
  }
}
