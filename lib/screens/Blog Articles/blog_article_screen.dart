import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/Blog%20Articles/components/bloc_article_components.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class BlocArticleScreen extends StatelessWidget {
  const BlocArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizes!.height,
          width: sizes!.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth() * 0.05, vertical: getHeight() * 0.04),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BlocarticleWidgets.myBackButton(
                      onPress: () {},
                      height: sizes!.widthRatio * 32,
                      width: sizes!.widthRatio * 32,
                    ),
                    Gap(getWidth() * 0.03),
                    TextView.size20Text('Blog Articles',
                        color: AppColors.pinkColor,
                        fontFamily: Assets.raleWaySemiBold,
                        fontWeight: FontWeight.w600),
                    const Spacer(),
                    BlocarticleWidgets.mycircleimage(),
                  ],
                ),
                Gap(getHeight() * 0.01),
                BlocarticleWidgets.myDivider(),
                Gap(getHeight() * 0.01),
                BlocarticleWidgets.searchField(),
                Gap(getHeight() * 0.04),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return BlocarticleWidgets.myBox(
                          title: 'Title',
                          subtitle:
                              'Early Learning Unraveled, Fascinating Brain',
                          titlefile: 'Files',
                          subtitlefile: '1',
                          titleaction: 'Action',
                          subtitleaction: 'Action Details');
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: getHeight() * 0.05,
                          child: BlocarticleWidgets.myDivider());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
