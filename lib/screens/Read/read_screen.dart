import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/Read/read_components.dart';

import '../../widgets/common_widgets.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final ReadComponents _readComponents = ReadComponents();
   int index = 0;
  void ontaaab(int intdx) {
    setState(() {
      index = intdx;
    });
  }

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
                  text:index==0? "Read":'Archived Reads',
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
                      SizedBox(height: getHeight() * 0.02),
                      CommonWidgets.searchField(),
                      SizedBox(height: getHeight() * 0.03),
                      ButtonsTabBar(
                        onTap: ontaaab,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 2, horizontal: getWidth() * 0.08),
                        unselectedBorderColor: AppColors.greyColor,
                        borderWidth: 1,
                        height: getHeight() * 0.045,
                        backgroundColor: AppColors.redColor,
                        unselectedBackgroundColor: AppColors.pureWhiteColor,
                        labelStyle:
                            const TextStyle(color: AppColors.pureWhiteColor),
                        unselectedLabelStyle:
                            const TextStyle(color: AppColors.greyColor),
                        borderColor: AppColors.pinkColor,
                        buttonMargin:
                            EdgeInsets.symmetric(horizontal: getWidth() * 0.02),
                        tabs: const [
                          Tab(
                            text: '        Read        ',
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
                            ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return _readComponents.myReadBox(
                                  titleText: 'Your text here',
                                  descriptionText:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua.',
                                  linkText: 'Your Link here',
                                  statustext: 'Your Status',
                                  actionText: 'Active Status',
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                    height: getHeight() * 0.05,
                                    child: _readComponents.myDividers());
                              },
                            ),
                            
                            ListView.separated(
                            
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return _readComponents.myArchievedBox(
                                  titleText: 'Your text here',
                                  descriptionText:
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor inci didunt ut labore et dolore magna aliqua.',
                                  linkText: 'Your Link here',
                                  actionText: 'Active Status',
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                    height: getHeight() * 0.05,
                                    child: _readComponents.myDividers());
                              },
                            ),
                            
                            
                          ],
                        ),
                      ),
                      SizedBox(height: getHeight() * 0.02),
                    ],
                  )),
            ]),
          ),
        ),
      ),
    ));
  }
}
