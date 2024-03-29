import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/constant/asset_constant.dart';
import 'package:flutter_dota_hero_list/common/constant/route_constant.dart';
import 'package:flutter_dota_hero_list/common/helper/resource.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/data/model/hero_stats.dart';
import 'package:flutter_dota_hero_list/presentation/home/home_controller.dart';
import 'package:flutter_dota_hero_list/presentation/widgets/error_connection.dart';
import 'package:flutter_dota_hero_list/presentation/widgets/hero_card.dart';
import 'package:flutter_dota_hero_list/presentation/widgets/filter_role_chip.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        switch (controller.heroStats.status) {
          case Status.LOADING:
            return Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  AssetConstant.icLogoName,
                  height: 30.0,
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case Status.ERROR:
            return Scaffold(
                appBar: AppBar(
                  title: Image.asset(
                    AssetConstant.icLogoName,
                    height: 30.0,
                  ),
                ),
                body: ErrorConnection(
                  errorMessage: controller.heroStats.error.toString(),
                  onPressed: () => controller.getHeroStats(),
                ));
          case Status.SUCCESS:
            return WillPopScope(
              onWillPop: () => controller.handleBackPress(),
              child: Scaffold(
                body: SafeArea(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverSafeArea(
                          sliver: SliverAppBar(
                            snap: false,
                            floating: false,
                            title: Image.asset(
                              AssetConstant.icLogoName,
                              height: 30.0,
                            ),
                          ),
                        ),
                      ];
                    },
                    body: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: AppColors.background,
                          child: FilterRoleChip(
                            itemCount: controller.getAllRoles().length,
                            roles: controller.getAllRoles(),
                            selected: controller.roleFiltered,
                            onSelected: (value, index) =>
                                controller.filterRoles(index, value),
                          ),
                        ),
                        Obx(
                          () => Expanded(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.heroesFiltered.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 95 / 100,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (_, index) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: HeroCard(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteConstant.detail,
                                      parameters: {
                                        'selectedHero': heroStatToJson(
                                            controller.heroesFiltered[index]),
                                        'heroes': heroStatsToJson(
                                            controller.heroesFiltered),
                                      },
                                    );
                                  },
                                  urlImage:
                                      controller.heroesFiltered[index].img,
                                  localizedName: controller
                                      .heroesFiltered[index].localizedName,
                                  roles: controller.heroesFiltered[index].roles!
                                      .join(', '),
                                  attrColor: controller.getAttrColor(
                                    controller
                                        .heroesFiltered[index].primaryAttr,
                                  )['colorPrime'],
                                  innerAttrColor: controller.getAttrColor(
                                    controller
                                        .heroesFiltered[index].primaryAttr,
                                  )['colorSecond'],
                                  primaryAttr: controller
                                      .heroesFiltered[index].primaryAttr
                                      .toString()
                                      .split('.')
                                      .last,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
