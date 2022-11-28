

import 'package:flutter/material.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/WeSpecials/wespecial.dart';
import 'package:we_skool_app/screens/contact_us/contact_us.dart';
import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/text_views.dart';

class HomeComponents {
  Widget appBar(
      {required String text,
      required String image,
      required bool? isDataFetched,
        required Function? onPressMenu
      }) {
    isDataFetched ??= false;
    return Container(
      decoration: const BoxDecoration(color: AppColors.pureWhiteColor),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: getHeight() * 0.02, horizontal: getWidth() * 0.05),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      onPressMenu!.call();
                    },
                    child: const Icon(Icons.menu, color: AppColors.pureBlack, size: 35)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView.size20Text("Home",
                        fontFamily: Assets.raleWaySemiBold,
                        fontWeight: FontWeight.w600,
                        color: AppColors.pureBlack),
                    CircleAvatar(
                      backgroundImage: isDataFetched
                          ? NetworkImage(image)
                          : const AssetImage(Assets.imagePlaceHolder)
                              as ImageProvider,
                      radius: getHeight() * 0.02, // 50.0
                      backgroundColor: AppColors.transparentColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            child: Divider(height: getHeight() * 0.02, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
          ),
        ],
      ),
    );
  }

  Widget homeCategoryContainer({required String text, required String image}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: getHeight() * 0.01, horizontal: getWidth() * 0.03),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.pureWhiteColor,
        border:
            Border.all(color: AppColors.borderColor, width: getWidth() * 0.005),
        borderRadius: BorderRadius.circular(
          getWidth() * .02,
        ),
        boxShadow:  const [
          BoxShadow(
              color: AppColors.borderColor,
              blurRadius: 5,
              offset: Offset(0,0)
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getHeight() * 0.06,
            width: getWidth() * 0.07,
            child: Image.asset(
              image,
            ),
          ),
          SizedBox(width: getWidth() * 0.04,),
          SizedBox(
            width: getWidth() * 0.25,
              child: TextView.size14Text(text, color: AppColors.blackLight, fontFamily: Assets.raleWayRegular, lines: 2))
        ],
      ),
    );
  }

  Widget scheduleContainer({
    @required String? time1,
    @required String? text1,
  }) {
    return Container(
      height: getHeight() * 0.05,
      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.01, vertical: getHeight() * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView.size14Text(time1 ?? "8:00 am - 8:30 am", color: AppColors.pureBlack, fontWeight: FontWeight.w500, fontFamily: Assets.raleWayMedium),
          TextView.size14Text(text1 ?? "Tummy Time: Caregiver", color: AppColors.pureBlack, fontWeight: FontWeight.w500, fontFamily: Assets.raleWayMedium),
          Divider(height: getHeight() * 0.05, color: AppColors.pureBlack),
        ],
      ),
    );
  }

  Widget buildDrawerMenu(
      {@required int? selectedPage,
        required BuildContext context,
        @required Function? onPress}) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.pureWhiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: getWidth() * 0.05, right: getWidth() * 0.02, top: getHeight() * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonWidgets.buildProfileContainer(imagePath: Assets.imagePlaceHolder),
                      GestureDetector(
                          onTap: () {

                            //Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel_outlined, size: getHeight() * 0.04, color: AppColors.pinkColor))
                    ],
                  ),
                  SizedBox(height: getHeight() * 0.02,),
                  TextView.size18Text("Angela Williams",
                      color: AppColors.pureBlack, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
                  SizedBox(height: getHeight() * 0.02,),
                  Divider(height: getHeight() * 0.01, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
                ],
              ),
            ),
            SizedBox(
              height: sizes!.regularPadding,
            ),
            Expanded(
              child: ListView(
                children: [
                  singleRow(
                      index: 0,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () {
                        onPress!.call(0);
                        Navigator.pop(context);
                        // Navigator.push(context,AppRoutes.appRoutes(AppRoutes.profileCusPage));
                      }),
                  singleRow(
                      index: 1,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () {
                        onPress!.call(1);
                        Navigator.pop(context);
                        // Navigator.push(context,AppRoutes.appRoutes(AppRoutes.notificationsPage));
                      }),
                  singleRow(
                      index: 2,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () {
                        onPress!.call(2);
                        PopupMenuButton<int>(
                          color: Colors.amber,
                          itemBuilder: (context)=> [
                            PopupMenuItem<int>(child: Text('blog'),value: 0,),
                            PopupMenuItem<int>(child: Text('Read'),value: 1,)

                          ]
                        );


                        // Navigator.push(context, AppRoutes.appRoutes(AppRoutes.queriesPage));
                      }),
                  singleRow(
                      index: 3,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () {
                        onPress!.call(3);
                        Navigator.pop(context);

                        // Navigator.push(context, AppRoutes.appRoutes(AppRoutes.inboxPage));
                      }),
                  singleRow(
                      index: 4,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () {
                        onPress!.call(4);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const WeSpecialScreen()));
                      }),
                  singleRow(
                      index: 5,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () async {
                        onPress!.call(5);
                        Navigator.pop(context);
                        // await logoutUser(context: context);
                      }),
                  singleRow(
                      index: 6,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () async {
                        onPress!.call(6);
                        Navigator.pop(context);
                        // await logoutUser(context: context);
                      }),
                  singleRow(
                      index: 7,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () async {
                        onPress!.call(7);
                        Navigator.pop(context);
                        // await logoutUser(context: context);
                      }),
                  singleRow(
                      index: 8,
                      selectedPage: selectedPage,
                      context: context,
                      onPress: () async {
                        onPress!.call(8);
                         Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const ContactUs()));

                        // await logoutUser(context: context);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget singleRow(
      {@required int? index,
        @required int? selectedPage,
        required BuildContext context,
        @required Function? onPress}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        height: sizes!.height * 0.07,
        width: sizes!.width * 0.75,
        color: selectedPage == index ? AppColors.yellowColor : Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            // top: (sizes.width ?? 0) * 0.04,
            // bottom: (sizes.width ?? 0) * 0.04,
              left: sizes!.width * 0.06
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              menuNameList[index!],
              style: const TextStyle(fontFamily: Assets.raleWayRegular),
            ),
          ),
        ),
      ),
    );
  }

  List<String> menuNameList = [
    "We Classes",
    "We Assessment",
    "We Parents Resource",
    "We Consultation",
    "We Specials",
    "We Payments",
    "We Calendar",
    "We Caregiver",
    "Contact Us"
  ];

}
