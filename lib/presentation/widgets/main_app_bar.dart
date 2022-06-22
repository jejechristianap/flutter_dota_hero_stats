import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/constant/asset_constant.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.itemCount,
    required this.roles,
    required this.selected,
    required this.onSelected,
  }) : super(key: key);

  final int itemCount;
  final List<dynamic> roles;
  final List<String> selected; //.contains(controller.getAllRoles()[0],)
  final Function(bool, int) onSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        color: AppColors.background,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(
                AssetConstant.icLogoName,
                height: 30.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: 50.0,
                child: ListView.builder(
                  itemCount: itemCount, //controller.getAllRoles().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: FilterChip(
                      checkmarkColor: Colors.red[400],
                      label: Text(
                        roles[index].toString(),
                      ),
                      selected: selected.contains(
                        roles[index],
                      ),
                      onSelected: (value) => onSelected(value, index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
