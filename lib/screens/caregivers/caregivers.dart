import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/Read/read_components.dart';
import 'package:we_skool_app/screens/caregivers/caregivers_components.dart';

import '../../res/assets.dart';
import '../../res/res.dart';
import '../../widgets/common_widgets.dart';

class CaregiversScreen extends StatefulWidget {
  const CaregiversScreen({super.key});

  @override
  State<CaregiversScreen> createState() => _CaregiversScreenState();
}

class _CaregiversScreenState extends State<CaregiversScreen> {
  final CareGiversComponents _careGiversComponents = CareGiversComponents();

  @override
  Widget build(BuildContext context) {
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
                  height:   sizes!.height * 0.85,
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
                        contentPadding: EdgeInsets.symmetric(horizontal: getWidth()*0.03),
                        unselectedBorderColor: AppColors.greyColor,
                        borderWidth: 1,
                      labelStyle: const TextStyle(color: AppColors.pureWhiteColor),
                      unselectedLabelStyle: const TextStyle(color: AppColors.greyColor),
                        height: getHeight() * 0.045,
                        backgroundColor: AppColors.redColor,
                        unselectedBackgroundColor: AppColors.pureWhiteColor,
                        borderColor: AppColors.pinkColor,
                        buttonMargin:
                            EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                        tabs: const[
                          Tab(
                            text: 'Assigned Caregivers',


                          ),
                          Tab(
                           text: 'Manage Caregivers',
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
                      SizedBox(height: getHeight() * 0.04),
                    ],
                  )),
            ]),
          ),
        ),
      ),
    ));
  }

  Widget assignedCaregivers() {
        return Column(
          children: [
            _careGiversComponents.myBox(
              firstname: 'Your First Name',
              lastname: 'Your Last Name',
              email: 'johanemail@email.com',
              status: 'Active'


            ),
          ],
        );
  }

  Widget manageCaregivers() {

    return Column(
      children: [
        CommonWidgets.searchField(),
        SizedBox(height: getHeight()*0.02),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return _careGiversComponents.myBox(
                  firstname: 'John',
                  lastname: 'Caregivers',
                  email: 'johanemail@email.com',
                  status: 'Active'


              );



            },
            separatorBuilder: (BuildContext context, int index) {
              return  SizedBox(
                height: getHeight()*0.02,
              );
            },
          ),
        ),
        CommonWidgets.getButton(onPress: (){},text: 'Add New',height: getHeight()*0.06),
      ],
    );

  }
}


