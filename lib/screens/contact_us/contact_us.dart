import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_components.dart';
import 'package:we_skool_app/utilities/Dailogbox.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';
import 'package:we_skool_app/widgets/text_views.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController? subjectController;
  TextEditingController? messageController;
  final DailyObservationComponents _dailyObservationComponents = DailyObservationComponents();

  @override
  void initState() {
    super.initState();
    subjectController = TextEditingController();
    messageController = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: sizes!.height,
                width: sizes!.width,
                color: AppColors.pureWhiteColor,
                // padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      child: CommonWidgets.appBarTextImage(
                          text: "Contact Us",
                          image: "",
                          isDataFetched: false),
                    ),
                    Container(
                      height: sizes!.height * 0.80,
                      width: getWidth(),
                      padding: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      // margin: EdgeInsets.symmetric(horizontal: getWidth() * 0.05),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Assets.lightBackground),
                            fit: BoxFit.fill),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getHeight() * 0.02,
                          ),
                          TextView.size18Text(
                            'Subject',
                            color: AppColors.textColor,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: getHeight() * 0.02,
                          ),
                          CommonWidgets.textField(
                            textEditingController: subjectController,
                            hint: "Your Subject",
                            textInputType: TextInputType.emailAddress,
                          ),
                          // ContactUsComponents.mytextField(
                          //   height: getHeight() * 0.054,
                          //   width: getWidth(),
                          //   hint: 'Your Subject',
                          // ),
                          SizedBox(
                            height: getHeight() * 0.02,
                          ),
                          TextView.size18Text(
                            'Message',
                            color: AppColors.textColor,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: getHeight() * 0.02,
                          ),
                          _dailyObservationComponents.textField(
                              textEditingController: messageController,
                            fieldColor: AppColors.pureWhiteColor,
                            borderColor: AppColors.hintTextGreyColor,
                            height: getHeight() * 0.15
                          ),
                          SizedBox(
                            height: getHeight() * 0.04,
                          ),
                          TextView.size18Text(
                            'File (Attach if applicable)',
                            color: AppColors.textColor,
                            fontFamily: Assets.raleWaySemiBold,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: getHeight() * 0.03,
                          ),
                          DottedBorder(
                              color: AppColors.greyColor,
                              strokeWidth: 1,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(getHeight() * 0.006),
                              padding: EdgeInsets.only(left: getWidth() * 0.02),
                              child: SizedBox(
                                height: getHeight() * 0.05,
                                width: getWidth() * 0.36,
                                child: Row(
                                  children: [
                                    TextView.size16Text(
                                        'Choose File', Assets.raleWayMedium,
                                        color: AppColors.grey2colrtext,
                                        fontWeight: FontWeight.w500,
                                        lines: 1),
                                    SizedBox(
                                      width: getWidth() * 0.03,
                                    ),
                                    const Icon(
                                      Icons.file_upload_outlined,
                                      color: AppColors.grey2colrtext,
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: getHeight() * 0.01,
                          ),
                          TextView.size12Text('*Max File size 8 mb',
                              color: AppColors.pinkColor,
                              fontWeight: FontWeight.w300,
                              fontFamily: Assets.raleWayLight),
                          Divider(
                              height: getHeight() * 0.01,
                              thickness: getHeight() * 0.001,
                              color: AppColors.dividerColor),
                          SizedBox(
                            height: getHeight() * 0.03,
                          ),
                          CommonWidgets.getButton(
                            height: getHeight()*0.06,
                              fontFamily: Assets.raleWaySemiBold,
                              fontSize: sizes!.fontSize18,
                              fontWeight: FontWeight.w600,
                              onPress: () {
                                // showAnimatedDialog(
                                //   context: context,
                                //
                                //   builder: (_) {
                                //     return const AlertDilog();
                                //   },
                                //   animationType: DialogTransitionType.none,
                                //   duration: const Duration(seconds: 1),
                                // );
                              },
                              text: 'Send'),
                        ],
                      ),
                    )
                  ]),
                ))));
  }
}
