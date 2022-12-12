import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';

import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../blog_articles/bloc_article_components.dart';

class MiscScreen extends StatefulWidget {
  const MiscScreen({super.key});

  @override
  State<MiscScreen> createState() => _MiscScreenState();
}

class _MiscScreenState extends State<MiscScreen> {
  final BlogArticleComponents _blogArticleComponents = BlogArticleComponents();

  List<String> genderList = ['1', '2'];
  String? _genderSelection;

  void updateTypeGender(String value) {
    setState(() {
      _genderSelection = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: sizes!.height,
      width: sizes!.width,
      color: AppColors.pureWhiteColor,
      child: SingleChildScrollView(
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
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _blogArticleComponents.myBox(
                         
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView.size14Text('Title',
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: Assets.raleWaySemiBold),
                              SizedBox(height: getHeight() * 0.015),
                              TextView.size14Text(
                                  'Early Learing Unraveled, Fascinating Brain',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                  fontFamily: Assets.raleWayMedium),

                              _blogArticleComponents.myDivider(),
                              TextView.size14Text('Files',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textColor,
                                  fontFamily: Assets.raleWaySemiBold),
                        
                              _blogArticleComponents.dropDown(
                                  selectedCategory: _genderSelection,
                                  updateSelectedCategory: updateTypeGender,
                                  categories: genderList,
                                  hint: '1'),
                            
                              _blogArticleComponents.myDivider(),
                              TextView.size14Text('Action',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textColor,
                                  fontFamily: Assets.raleWaySemiBold),
                              SizedBox(height: getHeight() * 0.015),
                              TextView.size14Text('Action Details',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.greyTextColor,
                                  fontFamily: Assets.raleWayMedium),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            height: getHeight() * 0.05,
                            child: _blogArticleComponents.myDivider());
                      },
                    ),
                  ),
                  SizedBox(height: getHeight() * 0.01)
                ],
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
