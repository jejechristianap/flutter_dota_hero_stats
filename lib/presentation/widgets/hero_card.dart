import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/helper.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key,
    required this.urlImage,
    required this.localizedName,
    required this.roles,
    required this.attrColor,
    required this.innerAttrColor,
    required this.primaryAttr,
    required this.onTap,
  }) : super(key: key);

  final String? urlImage;
  final String? localizedName;
  final String roles;
  final Color? attrColor;
  final Color? innerAttrColor;
  final String? primaryAttr;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: AppColors.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  Helper.getUrlImage(
                    urlImage, //controller.heroesFiltered[index].img,
                  ),
                  errorBuilder: (context, obj, st) {
                    return const Placeholder();
                  },
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  localizedName ?? 'Error',
                  style: AppTextStyles.heading3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  roles,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.body2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: attrColor,
                          ),
                        ),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: innerAttrColor,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        primaryAttr ?? 'Error',
                        style: AppTextStyles.body2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
