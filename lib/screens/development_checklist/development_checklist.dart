import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/development_checklist/development_checklist_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../res/colors.dart';

class DevelopemntChecklist extends StatelessWidget {
  const DevelopemntChecklist({super.key});

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
            child: Column(children: [
              CommonWidgets.appBarIconImageText(
                  text: "Development Check",
                  image: "",
                  isDataFetched: false,
                  onPressMenu: () {
                    Navigator.pop(context);
                  }),
              Container(
                height: sizes!.height * 0.80,
                margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.lightBackground),
                      fit: BoxFit.fill),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: getHeight() * 0.04,
                    ),
                    CommonWidgets.searchField(),
                    SizedBox(
                      height: getHeight() * 0.03,
                    ),
                    DevelepmentCheckComponents.myBox(
                      title: 'Title',
                      titletxt: 'Your text here',
                      Desc: 'Description',
                      desctxt: 'Your text here...',
                      status: 'Status',
                      satustxt: 'Active',
                      Agegroup: 'Age group',
                      agegrouptxt: '6 months to 12 months',
                      height: getHeight() * 0.44,
                    ),
                    SizedBox(
                      height: getHeight() * 0.04,
                    ),
                    CommonWidgets.getButton(onPress: () {}, text: 'Add New'),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
