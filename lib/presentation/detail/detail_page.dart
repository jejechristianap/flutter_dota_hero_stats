import 'package:flutter/material.dart';
import 'package:flutter_dota_hero_list/common/helper/helper.dart';
import 'package:flutter_dota_hero_list/common/styles/app_colors.dart';
import 'package:flutter_dota_hero_list/common/styles/app_text_styles.dart';
import 'package:flutter_dota_hero_list/presentation/detail/detail_controller.dart';
import 'package:flutter_dota_hero_list/presentation/widgets/hero_attr.dart';
import 'package:flutter_dota_hero_list/presentation/widgets/similiar_hero.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) => WillPopScope(
        onWillPop: () => controller.handleBackPress(),
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  leading: IconButton(
                    onPressed: () async {
                      if (await controller.handleBackPress()) Get.back();
                    },
                    icon: const Icon(
                      Icons.keyboard_arrow_left_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      controller.heroStat.localizedName ?? '',
                    ),
                    background: Stack(
                      children: [
                        Image.network(
                          Helper.getUrlImage(controller.heroStat.img),
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.0, 1.0],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10, bottom: 70),
                            child: Text(
                              controller.heroStat.roles?.join(', ') ?? '',
                              style: AppTextStyles.body.copyWith(
                                color: Colors.grey[500],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(18),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HeroAttr(
                          title: 'Type',
                          value: controller.heroStat.attackType
                              .toString()
                              .split('.')
                              .last,
                        ),
                        HeroAttr(
                          title: 'Max Atk',
                          value:
                              '${controller.heroStat.baseAttackMin} - ${controller.heroStat.baseAttackMax}'
                                  .toString()
                                  .split('.')
                                  .last,
                        ),
                        HeroAttr(
                          title: 'Health',
                          value: controller.heroStat.baseHealth.toString(),
                        ),
                        HeroAttr(
                          title: 'MSPD',
                          value: controller.heroStat.moveSpeed.toString(),
                        ),
                        HeroAttr(
                          title: 'Attr',
                          value: controller.heroStat.primaryAttr
                              .toString()
                              .split('.')
                              .last,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, bottom: 10, top: 20),
                    child: Text(
                      'Similiar Heroes',
                      style: AppTextStyles.body.copyWith(fontSize: 22),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: controller.similiarHeroes.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 18),
                      child: InkWell(
                        onTap: () {
                          controller.updateSelectedHeroes(
                              hero: controller.similiarHeroes[index]);
                        },
                        child: SimiliarHero(
                          imgUrl: controller.similiarHeroes[index].img,
                          heroName:
                              controller.similiarHeroes[index].localizedName,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
