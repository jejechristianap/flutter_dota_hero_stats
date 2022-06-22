import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';

class HeroAttr extends StatelessWidget {
  const HeroAttr({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyles.body2,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: AppTextStyles.heading2,
        ),
      ],
    );
  }
}
