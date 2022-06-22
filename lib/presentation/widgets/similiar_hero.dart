import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/helper.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';

class SimiliarHero extends StatelessWidget {
  const SimiliarHero({
    Key? key,
    required this.imgUrl,
    required this.heroName,
  }) : super(key: key);

  final String? imgUrl;
  final String? heroName;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.network(
            Helper.getUrlImage(imgUrl),
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: 120.0,
          ),
          Container(height: 120.0, color: Colors.black54),
          Text(
            heroName ?? 'Error',
            style: AppTextStyles.heading1.copyWith(color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
