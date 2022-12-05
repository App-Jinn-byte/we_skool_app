import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/Blog%20Articles/bloc_article_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class MiscScreen extends StatefulWidget {
  const MiscScreen({super.key});

  @override
  State<MiscScreen> createState() => _MiscScreenState();
}

class _MiscScreenState extends State<MiscScreen> {
  final BlogArticleComponents _blogArticleComponents = BlogArticleComponents();

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body:  Container(
          height: sizes!.height,
          width: sizes!.width,
          color: AppColors.pureWhiteColor,
          child: Column(
              children: [
          CommonWidgets.appBarIconImageText(
          text: "Miscellaneous",
              image: "",
              isDataFetched: false,
              onPressMenu: () {
                Navigator.pop(context);
              }),
          Container(
            height: sizes!.height * 0.85,
            margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.lightBackground),
                  fit: BoxFit.fill),
            ),
          child: Column(
            children: [
            SizedBox(height: getHeight() * 0.01),

             CommonWidgets.searchField(),
        SizedBox(height: getHeight() * 0.04),

              Expanded(
                child: ListView.separated(
                  // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return _blogArticleComponents.myBox(
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
                        child: BlogArticleComponents.myDivider());
                  },
                ),
              ),
              SizedBox(height: getHeight() * 0.01)
            ],
          ),
        ),
              ],
      ),
        )
      )
    );
  }
}
