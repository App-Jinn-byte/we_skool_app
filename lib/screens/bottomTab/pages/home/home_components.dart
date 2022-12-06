import 'package:flutter/material.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/blog_articles/blog_article_screen.dart';
import 'package:we_skool_app/screens/Misclaneous/misc.dart';
import 'package:we_skool_app/screens/Read/read_screen.dart';
import 'package:we_skool_app/screens/WeSpecials/wespecial.dart';
import 'package:we_skool_app/screens/bottomTab/pages/calendar/calendar.dart';
import 'package:we_skool_app/screens/consultation_request/consultation_request.dart';
import 'package:we_skool_app/screens/classes/classes.dart';
import 'package:we_skool_app/screens/payments/payments.dart';
import 'package:we_skool_app/screens/sign_in/sign_in.dart';

import '../../../../res/assets.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../widgets/text_views.dart';
import 'package:we_skool_app/screens/caregivers/caregivers.dart';
import '../../../contact_us/contact_us.dart';
import '../../bottom_tab.dart';

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

  // Widget singleRow(
  //     {@required int? index,
  //     @required int? selectedPage,
  //     required BuildContext context,
  //     @required Function? onPress}) {
  //   return GestureDetector(
  //     onTap: () {
  //       onPress!.call();
  //     },
  //     child: Container(
  //       height: sizes!.height * 0.07,
  //       width: sizes!.width * 0.75,
  //       color: selectedPage == index ? AppColors.yellowColor : Colors.white,
  //       child: Padding(
  //         padding: EdgeInsets.only(
  //             // top: (sizes.width ?? 0) * 0.04,
  //             // bottom: (sizes.width ?? 0) * 0.04,
  //             left: sizes!.width * 0.06),
  //         child: Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text(
  //             menuNameList[index!],
  //             style: const TextStyle(fontFamily: Assets.raleWayRegular),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget drawerListWidget({
  //   @required int? index,
  //   @required int? selectedPage,
  //   required BuildContext context,
  //   @required Function? onPress}) {
  //   return GestureDetector(
  //     onTap: () {
  //       onPress!.call();
  //     },
  //     child: Container(
  //       height: sizes!.height * 0.07,
  //       width: sizes!.width * 0.57,
  //       color: selectedPage == index ? AppColors.yellowColor : Colors.white,
  //       child: Padding(
  //         padding: EdgeInsets.only(
           
  //             left: sizes!.width * 0.06),
  //         child:  Align(
  //           alignment: Alignment.centerLeft,
  //           child: Text(
  //             menuNameList[index!],
  //             style: const TextStyle(fontFamily: Assets.raleWayRegular),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }



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
  List<String> menuNameList = [
    "We Classes",
    "We Assessment",
    "We Parents Resource",
    "We Consultation",
    "We Specials",
    "We Payments",
    "We Calendar",
    "We Caregiver",
  ];
  List<String> menuIconList = [
    Assets.weClasses,
    Assets.weAssessment,
    Assets.weParents,
    Assets.weConsultation,
    Assets.weSpecial,
    Assets.wePayments,
    Assets.weCalender,
   Assets.weCaregivers,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.pureWhiteColor,
          width: getWidth() * 0.64,
          height: getHeight(),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth() * 0.05,
                        right: getWidth() * 0.02,
                        top: getHeight() * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidgets.buildProfileContainer(
                                imagePath: Assets.imagePlaceHolder,
                                isDataFetched: false
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: getWidth() * 0.35,
                                      bottom: getHeight() * 0.02),
                                  child: Container(
                                    height: getHeight() * 0.02,
                                    width: getWidth() * 0.035,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(Assets.crossIcon),
                                        fit: BoxFit.fill
                                      ),
                                    ),
                                  )
                                )),
                          ],
                        ),
                        SizedBox(
                          height: getHeight() * 0.02,
                        ),
                        TextView.size18Text("Angela Williams",
                            color: AppColors.pureBlack,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: getHeight() * 0.02,
                        ),
                        Container(
                            height: getHeight() * 0.00078,
                            width: getWidth() * 0.54,
                            color: AppColors.dividerColor),
                        SizedBox(
                          height: getHeight() * 0.02,
                        ),
                      ],
                    ),
                  ),

                  drawerListWidget(
                      index: 0,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(0);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const Classes()));
                      }
                  ),  
                  drawerListWidget(
                      index: 1,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(1);
                        Navigator.pop(context);
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (_) => const Classes()));
                      }
                  ),
                  drawerListWidget(
                      index: 2,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(2);
                        // Navigator.pop(context);
                        setState(() {
                          istrue = !istrue;
                        });
                      }
                  ),
                  drawerListWidget(
                      index: 3,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(3);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const ConsultationRequest()));
                      }
                  ),
                  drawerListWidget(
                      index: 4,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(4);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const WeSpecialScreen()));
                      }
                  ),
                  drawerListWidget(
                      index: 5,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(5);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const WePayments()));
                      }
                  ),
                  drawerListWidget(
                      index: 6,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(6);
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (_) => const BottomTab(pageIndex: 2)), (route) => false);
                      }
                  ),
                  drawerListWidget(
                      index: 7,
                      selectedPage: widget.selectedPage,
                      context: context,
                      onPress: () {
                        widget.onPress!.call(7);
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const CaregiversScreen()));
                      }
                  ),
                  // drawerListWidget(
                  //     index: 8,
                  //     selectedPage: widget.selectedPage,
                  //     context: context,
                  //     onPress: () {
                  //       widget.onPress!.call(8);
                  //       Navigator.pop(context);
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (_) => const ContactUs()));
                  //     }
                  // ),
                  SizedBox(height: getHeight() * 0.05),
                  Padding(
                    padding: EdgeInsets.only(left: getWidth() * 0.05),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (_) => const SignIn()), (route) => false);
                      },
                      child: Container(
                        height: getHeight() * 0.035,
                        width: getWidth() * 0.26,
                        decoration: BoxDecoration(
                          color: AppColors.pinkColor,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(
                            getWidth() * .012,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(Assets.logout,height: getHeight()*0.02),
                       
                            TextView.size18Text(
                              "Log out",
                              fontSize: sizes!.fontSize14,
                              fontFamily: Assets.raleWaySemiBold,
                              fontWeight: FontWeight.w600,
                              color: AppColors.pureWhiteColor,
                            ),
                          ],
                        ),
                      ),
                    ))
                
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
                    top: getHeight() * 0.0, bottom: getHeight() * 0.08),
                height: getHeight() * 0.15,
                width: getWidth() * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const BlocArticleScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: getWidth() * 0.02),
                          Container(
                            height: getHeight() * 0.01,
                            width: getWidth() * 0.015,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.pureWhiteColor
                            ),
                          ),
                          SizedBox(width: getWidth() * 0.02),
                          TextView.size14Text("Blog",
                              color: AppColors.pureWhiteColor,
                              fontFamily: Assets.raleWayMedium,
                              fontWeight: FontWeight.w500),
                        ],
                      )
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ReadScreen()));
                      },
                      child: Row(
                        children: [
                          SizedBox(width: getWidth() * 0.02),
                          Container(
                            height: getHeight() * 0.01,
                            width: getWidth() * 0.015,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pureWhiteColor
                            ),
                          ),
                          SizedBox(width: getWidth() * 0.02),
                          TextView.size14Text("Read",
                              color: AppColors.pureWhiteColor,
                              fontFamily: Assets.raleWayMedium,
                              fontWeight: FontWeight.w500),
                        ],
                      )
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MiscScreen()));

                      },
                      child: Row(
                        children: [
                          SizedBox(width: getWidth() * 0.02),
                          Container(
                            height: getHeight() * 0.01,
                            width: getWidth() * 0.015,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.pureWhiteColor
                            ),
                          ),
                          SizedBox(width: getWidth() * 0.02),
                          TextView.size14Text("Miscellaneous",
                              color: AppColors.pureWhiteColor,
                              fontFamily: Assets.raleWayMedium,
                              fontWeight: FontWeight.w500),
                        ],
                      )
                    )
                  ],
                ))
            : Container(),
      ],
    );

  }

  Widget drawerListWidget({
    @required int? index,
    @required int? selectedPage,
    required BuildContext context,
    @required Function? onPress}) {
    return GestureDetector(
      onTap: () {
        onPress!.call();
      },
      child: Container(
        height: sizes!.height * 0.07,
        width: sizes!.width * 0.64,
        color: selectedPage == index ? AppColors.yellowColor : AppColors.pureWhiteColor,
        child: Padding(
          padding: EdgeInsets.only(left: sizes!.width * 0.05),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(menuIconList[index!],
                  height: getHeight()*0.02,
                  width: getWidth() * 0.06,
                  color: selectedPage == index ? AppColors.pureWhiteColor: AppColors.greySideMenuText),
               SizedBox(width: getWidth()*0.03),
              TextView.size16Text(menuNameList[index],
                  Assets.raleWayMedium, color: selectedPage == index ? AppColors.pureWhiteColor: AppColors.greySideMenuText, lines: 1, fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ),
    );
  }
}
