import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/Read/read_components.dart';

import '../../widgets/common_widgets.dart';

class ReadScreen extends StatelessWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Container(
          height: sizes!.height,
          width: sizes!.width,
          color: AppColors.pureWhiteColor,
          child: Column(
              children: [
          CommonWidgets.appBarIconImageText(
          text: "Read",
              image: "",
              isDataFetched: false,
              onPressMenu: () {
                Navigator.pop(context);
              }),
          Container(
            height: sizes!.height * 0.76,
            margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.lightBackground),
                  fit: BoxFit.fill),
            ),
                child: Column(
                  children: [
                SizedBox(height: getHeight() * 0.02),

               CommonWidgets.searchField(),
                 SizedBox(height: getHeight() * 0.04),

                ButtonsTabBar(
                  contentPadding:  EdgeInsets.all(getHeight()*0.001),
                  unselectedBorderColor: AppColors.greyColor,
                  borderWidth: 1,
                  height: getHeight() * 0.045,

                  backgroundColor: AppColors.redColor,
                  unselectedBackgroundColor: AppColors.pureWhiteColor,

                  borderColor: AppColors.greyColor,
                  buttonMargin:
                      EdgeInsets.symmetric(horizontal: getWidth() * 0.02),

                  tabs: [
                    Tab(
                      child: SizedBox(
                          height: getHeight() * 0.04,
                          width: getWidth() * 0.39,
                          child: const Center(
                              child: Text(
                            'Read',
                            style: TextStyle(color: AppColors.greyColor),
                          ))),
                    ),
                    Tab(
                      child: SizedBox(
                          height: getHeight() * 0.04,
                          width: getWidth() * 0.39,
                          child: const Center(
                              child: Text(
                            'Archived Read',
                            style: TextStyle(color: AppColors.greyColor),
                          ))),
                    ),
                  ],
                ),
                SizedBox(height: getHeight() * 0.03),

                Expanded(
                  child: TabBarView(
                    children: [
                      Innermaterial(),
                      Innermaterial(),
                    ],
                  ),
                ),

                  ],
                )
              
              
              ),
              ]
            ),
          ),
        ),
      )
    );
    
      
    
  }

  Widget Innermaterial() {
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return ReadWidgets.myBox(
          title: 'Title',
          subtitle: 'your title here',
          titleaction: 'Action',
          subtitleaction: 'Action Status',
          descriptiontext: 'Description',
          subtitledesc: 'asas asdasd asdasd dasdasdad DsdDad',
          titlelink: 'Link',
          subtitlelink: 'your link here',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
            height: getHeight() * 0.05, child: ReadWidgets.myDividers());
      },
    );
  }
}
