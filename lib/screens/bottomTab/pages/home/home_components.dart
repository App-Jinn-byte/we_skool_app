import 'package:flutter/material.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/Blog%20Articles/blog_article_screen.dart';
import 'package:we_skool_app/screens/Misclaneous/misc.dart';
import 'package:we_skool_app/screens/Read/read_screen.dart';
import 'package:we_skool_app/screens/WeSpecials/wespecial.dart';
import 'package:we_skool_app/screens/bottomTab/pages/calendar/calendar.dart';
import 'package:we_skool_app/screens/consultation_request/consultation_request.dart';
import 'package:we_skool_app/screens/classes/classes.dart';
import 'package:we_skool_app/screens/payments/payments.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/text_views.dart';
import 'package:we_skool_app/screens/caregivers/caregivers.dart';
import '../../../contact_us/contact_us.dart';

class HomeComponents {
  Widget appBar(
      {required String text,
      required String image,
      required bool? isDataFetched,
      required Function? onPressMenu}) {
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
                    child: const Icon(Icons.menu,
                        color: AppColors.pinkColor, size: 35)),
                SizedBox(width: getWidth() * 0.02),
                SizedBox(
                  width: getWidth() * 0.7,
                  child: TextView.size20Text(text,
                      fontFamily: Assets.raleWaySemiBold,
                      fontWeight: FontWeight.w600,
                      color: AppColors.pureBlack),
                ),
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
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
            child: Divider(
                height: getHeight() * 0.01,
                thickness: getHeight() * 0.001,
                color: AppColors.dividerColor),
          ),
        ],
      ),
    );
  }

  Widget homeCategoryContainer(
      {required String text,
      required String image,
      @required Function? onPress}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: getHeight() * 0.01, horizontal: getWidth() * 0.03),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.pureWhiteColor,
          border: Border.all(
              color: AppColors.borderColor, width: getWidth() * 0.005),
          borderRadius: BorderRadius.circular(
            getWidth() * .02,
          ),
          boxShadow: const [
            BoxShadow(
                color: AppColors.borderColor,
                blurRadius: 5,
                offset: Offset(0, 0))
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
            SizedBox(
              width: getWidth() * 0.04,
            ),
            SizedBox(
                width: getWidth() * 0.25,
                child: TextView.size14Text(text,
                    color: AppColors.blackLight,
                    fontFamily: Assets.raleWayRegular,
                    lines: 2))
          ],
        ),
      ),
    );
  }

  Widget scheduleContainer({
    @required String? time1,
    @required String? text1,
  }) {
    return Container(
      height: getHeight() * 0.05,
      padding: EdgeInsets.symmetric(
          horizontal: getWidth() * 0.01, vertical: getHeight() * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView.size14Text(time1 ?? "8:00 am - 8:30 am",
              color: AppColors.pureBlack,
              fontWeight: FontWeight.w500,
              fontFamily: Assets.raleWayMedium),
          TextView.size14Text(text1 ?? "Tummy Time: Caregiver",
              color: AppColors.pureBlack,
              fontWeight: FontWeight.w500,
              fontFamily: Assets.raleWayMedium),
          Divider(height: getHeight() * 0.05, color: AppColors.pureBlack),
        ],
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
              left: sizes!.width * 0.06),
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

class Builddrawers extends StatefulWidget {
  const Builddrawers({
    Key? key,
    required this.selectedPage,
    required this.context,
    required this.onPress,
    // required this.istrue,
  }) : super(key: key);

  final int? selectedPage;
  final BuildContext context;
  final Function? onPress;
  //final bool? istrue;

  @override
  State<Builddrawers> createState() => _BuilddrawersState();
}

class _BuilddrawersState extends State<Builddrawers> {
  bool istrue = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.pureWhiteColor,
          width: getWidth() * 0.66,
          height: getHeight(),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth() * 0.05,
                        right: getWidth() * 0.02,
                        top: getHeight() * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidgets.buildProfileContainer(
                                imagePath: Assets.imagePlaceHolder),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getWidth() * 0.2,
                                      bottom: getHeight() * 0.02),
                                  child: Icon(Icons.cancel_outlined,
                                      size: getHeight() * 0.04,
                                      color: AppColors.pinkColor),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: getHeight() * 0.03,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: getWidth() * 0.09),
                          child: TextView.size18Text("Angela Williams",
                              color: AppColors.pureBlack,
                              fontFamily: Assets.raleWaySemiBold,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: getHeight() * 0.02,
                        ),
                        Container(
                            height: getHeight() * 0.00078,
                            width: getWidth() * 0.52,
                            color: AppColors.greyColor),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getWidth() * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const Classes()));
                    },
                    child: Row(

                      children: [

                        Padding(
                          padding:  EdgeInsets.only(left: getWidth()*0.03),
                          child: Image.asset(Assets.weClasses),
                        ),

                        Container(
                          height: sizes!.height * 0.07,
                          width: sizes!.width * 0.57,
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.only(
                                // top: (sizes.width ?? 0) * 0.04,
                                // bottom: (sizes.width ?? 0) * 0.04,
                                left: sizes!.width * 0.06),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'We Classes',
                                style:
                                    TextStyle(fontFamily: Assets.raleWayRegular),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: sizes!.height * 0.07,
                    width: sizes!.width * 0.57,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: sizes!.width * 0.06),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'We Assessment',
                          style: TextStyle(fontFamily: Assets.raleWayRegular),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        istrue = !istrue;
                      });
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.66,
                      color: AppColors.yellowColor,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We Parents Resource',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ConsultationRequest()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We Consultation',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const WeSpecialScreen()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We Specials',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const WePayments()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We payments',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Calendar()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We Calender',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CaregiversScreen()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'We Caregivers',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ContactUs()));
                    },
                    child: Container(
                      height: sizes!.height * 0.07,
                      width: sizes!.width * 0.57,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: sizes!.width * 0.06),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Contact Us',
                            style:
                                TextStyle(fontFamily: Assets.raleWayRegular),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //this is drawer open..............
        istrue
            ? Container(
                decoration: const BoxDecoration(
                  color: AppColors.yellowColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                margin: EdgeInsets.only(
                    top: getHeight() * 0.0, bottom: getHeight() * 0.048),
                height: getHeight() * 0.14,
                width: getWidth() * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BlocArticleScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                          Container(
                            height: getHeight() * 0.016,
                            width: getWidth() * 0.016,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                          Text(
                            'Blog',
                            style: TextStyle(
                                color: AppColors.pureWhiteColor,
                                fontSize: getFontRatio() * 15.0),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ReadScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                          Container(
                            height: getHeight() * 0.016,
                            width: getWidth() * 0.016,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                           Text(
                            'Read',
                            style: TextStyle(color: AppColors.pureWhiteColor,fontSize: getFontRatio() * 15.0),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MiscScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                          Container(
                            height: getHeight() * 0.016,
                            width: getWidth() * 0.016,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(
                            width: getWidth() * 0.02,
                          ),
                          Text(
                            'Miscellaneous',
                            style: TextStyle(color: AppColors.pureWhiteColor,fontSize: getFontRatio() * 15.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
            : Container(),
      ],
    );
    // afra bhai code.........
    // return Drawer(
    //   child: Container(
    //     decoration: const BoxDecoration(
    //       color: AppColors.pureWhiteColor
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.only(
    //               left: getWidth() * 0.05, right: getWidth() * 0.02, top: getHeight() * 0.02),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   CommonWidgets.buildProfileContainer(imagePath: Assets.imagePlaceHolder),
    //                   GestureDetector(
    //                       onTap: () {

    //                         //Navigator.pop(context);
    //                       },
    //                       child: Icon(Icons.cancel_outlined, size: getHeight() * 0.04, color: AppColors.pinkColor))
    //                 ],
    //               ),
    //               SizedBox(height: getHeight() * 0.02,),
    //               TextView.size18Text("Angela Williams",
    //                   color: AppColors.pureBlack, fontFamily: Assets.raleWaySemiBold, fontWeight: FontWeight.w600),
    //               SizedBox(height: getHeight() * 0.02,),
    //               Divider(height: getHeight() * 0.01, thickness: getHeight() * 0.001, color: AppColors.dividerColor),
    //             ],
    //           ),
    //         ),
    //         SizedBox(
    //           height: sizes!.regularPadding,
    //         ),
    //         Expanded(
    //           child: ListView(
    //             children: [
    //               singleRow(
    //                   index: 0,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () {
    //                     onPress!.call(0);
    //                     Navigator.pop(context);
    //                      Navigator.push(context,
    //                                   MaterialPageRoute(builder: (_) => const Classes()));
    //                     // Navigator.push(context,AppRoutes.appRoutes(AppRoutes.profileCusPage));
    //                   }),
    //               singleRow(
    //                   index: 1,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () {
    //                     onPress!.call(1);
    //                     Navigator.pop(context);
    //                     // Navigator.push(context,AppRoutes.appRoutes(AppRoutes.notificationsPage));
    //                   }),
    //               singleRow(
    //                   index: 2,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () {
    //                     onPress!.call(2);
    //                     // PopupMenuButton<int>(
    //                     //   color: Colors.amber,
    //                     //   itemBuilder: (context)=> [
    //                     //     PopupMenuItem<int>(child: Text('blog'),value: 0,),
    //                     //     PopupMenuItem<int>(child: Text('Read'),value: 1,)
    //                     //
    //                     //   ]
    //                     // );

    //                     // Navigator.push(context, AppRoutes.appRoutes(AppRoutes.queriesPage));
    //                   }),
    //               singleRow(
    //                   index: 3,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () {
    //                     onPress!.call(3);
    //                     Navigator.pop(context);
    //                     Navigator.push(context,
    //                         MaterialPageRoute(builder: (_) => const ConsultationRequest()));
    //                     // Navigator.push(context, AppRoutes.appRoutes(AppRoutes.inboxPage));
    //                   }),
    //               singleRow(
    //                   index: 4,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () {
    //                     onPress!.call(4);
    //                     Navigator.pop(context);
    //                     Navigator.push(context,
    //                         MaterialPageRoute(builder: (_) => const WeSpecialScreen()));
    //                   }),
    //               singleRow(
    //                   index: 5,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () async {
    //                     onPress!.call(5);
    //                     Navigator.pop(context);
    //                     Navigator.push(context,
    //                                   MaterialPageRoute(builder: (_) => const WePayments()));
    //                     // await logoutUser(context: context);
    //                   }),
    //               singleRow(
    //                   index: 6,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () async {
    //                     onPress!.call(6);
    //                     Navigator.pop(context);
    //                     // await logoutUser(context: context);
    //                   }),
    //               singleRow(
    //                   index: 7,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () async {
    //                     onPress!.call(7);
    //                     Navigator.pop(context);
    //                     Navigator.push(context,
    //                         MaterialPageRoute(builder: (_) => const CaregiversScreen()));
    //                     // await logoutUser(context: context);
    //                   }),
    //               singleRow(
    //                   index: 8,
    //                   selectedPage: selectedPage,
    //                   context: context,
    //                   onPress: () async {
    //                     onPress!.call(8);
    //                      Navigator.push(context,
    //                             MaterialPageRoute(builder: (_) => const ContactUs()));

    //                     // await logoutUser(context: context);
    //                   }),
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
