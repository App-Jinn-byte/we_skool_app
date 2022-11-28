import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/Read/read_components.dart';
import 'package:we_skool_app/screens/caregivers/caregivers_components.dart';

import '../../res/assets.dart';
import '../../res/res.dart';
import '../../widgets/common_widgets.dart';

class CaregiversScreen extends StatelessWidget {
  const CaregiversScreen({super.key});

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
            child: Column(children: [
              CommonWidgets.appBarIconImageText(
                  text: "Caregivers",
                  image: "",
                  isDataFetched: false,
                  onPressMenu: () {
                    Navigator.pop(context);
                  }),
              Container(
                  height:   sizes!.height * 0.80,
                  margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Assets.lightBackground),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: getHeight() * 0.04),
                      ButtonsTabBar(
                        contentPadding: EdgeInsets.all(getHeight() * 0.001),
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
                                width: getWidth() * 0.41,
                                child: const Center(
                                    child: Text(
                                  'Assigned Caregivers',
                                  style: TextStyle(color: AppColors.greyColor),
                                ))),
                          ),
                          Tab(
                            child: SizedBox(
                                height: getHeight() * 0.04,
                                width: getWidth() * 0.41,
                                child: const Center(
                                    child: Text(
                                  'Manage Caregivers',
                                  style: TextStyle(color: AppColors.greyColor),
                                ))),
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight() * 0.03),
                      Expanded(
                        child: TabBarView(
                          children: [
                            assignedCaregivers(),
                            manageCaregivers(),
                          ],
                        ),
                      ),
                    ],
                  )),
            ]),
          ),
        ),
      ),
    ));
  }

  Widget assignedCaregivers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Caregivers.myBox(
          firstname: 'First Name',
          lastname: 'Last Name',
          email: 'Email',
          lastslide: 'Contact Number',
          lastslide2: '+123 544 342 00'
    
    
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox();
      },
    );
  }
   Widget manageCaregivers() {
    
    return Column(
      children: [
        CommonWidgets.searchField(),
        SizedBox(height: getHeight()*0.02),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Caregivers.myBox(
                firstname: 'First Name',
                lastname: 'Last Name',
                email: 'Email',
                lastslide: 'Status',
                lastslide2: 'Your Status'
                
          
          
              );
              
              
            
            },
            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.only( top: getHeight()*0.03,bottom: getHeight()*0.03),
                child: SizedBox(
                    height: getHeight() * 0.05, child: CommonWidgets.getButton(onPress: (){},text: 'Add New')),
              );
            },
          ),
        ),
      ],
    );
  }
}
