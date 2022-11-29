import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/screens/classes/classes_components.dart';

import '../../res/assets.dart';
import '../../res/colors.dart';
import '../../res/res.dart';
import '../../widgets/common_widgets.dart';

class Classes extends StatefulWidget {
  const Classes({Key? key}) : super(key: key);

  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
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
                  text: "Classes",
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
                      SizedBox(height: getHeight() * 0.04),
                      ButtonsTabBar(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 35),
                        unselectedBorderColor: AppColors.greyColor,
                        borderWidth: 1,
                        height: getHeight() * 0.045,
                        labelStyle:
                            const TextStyle(color: AppColors.pureWhiteColor),
                        unselectedLabelStyle:
                            const TextStyle(color: AppColors.greyColor),
                        backgroundColor: AppColors.redColor,
                        unselectedBackgroundColor: AppColors.pureWhiteColor,
                        borderColor: AppColors.greyColor,
                        buttonMargin:
                            EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                        tabs: const [
                          Tab(
                            text: '     Classes     ',
                          ),
                          Tab(
                            text: 'Special Classes',
                          ),
                        ],
                      ),
                      SizedBox(height: getHeight() * 0.03),
                      CommonWidgets.searchField(),
                      SizedBox(height: getHeight() * 0.03),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Myclass(),
                            specialClass(),
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

  Widget Myclass() {
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 2,
      itemBuilder: (context, index) {
        return SpClassComponents.myBoxcls(
          classname: 'Carrefour',
          students: '50 Students',
          agegroup: '12 to 18 mon',
          teacher: 'Alan Hawkr',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: getHeight() * 0.04,
        );
      },
    );
  }

  Widget specialClass() {
    return ListView.separated(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 2,
      itemBuilder: (context, index) {
        return SpClassComponents.myBoxspecialcls(
          classname: 'Carrefour',
          status: 'Enrolled',
          date: '12/11/2022',
          starttime: '11:00AM',
          teacher: 'adnan Hawkr',
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: getHeight() * 0.04,
        );
      },
    );
  }
}
