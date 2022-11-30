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
          child: SingleChildScrollView(
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 2,horizontal: 35),
                    unselectedBorderColor: AppColors.greyColor,
                    borderWidth: 1,
                    height: getHeight() * 0.045,
          
                    backgroundColor: AppColors.redColor,
                    unselectedBackgroundColor: AppColors.pureWhiteColor,
                      labelStyle: const TextStyle(color: AppColors.pureWhiteColor),
                      unselectedLabelStyle: const TextStyle(color: AppColors.greyColor),
          
                    borderColor: AppColors.greyColor,
                    buttonMargin:
                        EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
          
                    tabs: const[
                      Tab(
                        text: '        Read         ',
                      ),
                      Tab(
                        text: 'Archived Reads',
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
          titletxt: 'Your text here',
          Desc: 'Description',
          desctxt: 'your desc here...',
          Link: 'Link',
          linktxt: 'Your Link here',
          action: 'Action',
          actiontxt: 'Active Status',
         
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
            height: getHeight() * 0.05, child: ReadWidgets.myDividers());
      },
    );
  }
}
