import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/add_caregivers/add_caregivers_components.dart';
import 'package:we_skool_app/widgets/text_views.dart';

import '../../widgets/common_widgets.dart';

class AddCaregivers extends StatefulWidget {
  const AddCaregivers({super.key});

  @override
  State<AddCaregivers> createState() => _AddCaregiversState();
}

class _AddCaregiversState extends State<AddCaregivers> {
  final Addcaregiverscomponents _addcaregiverscomponents = Addcaregiverscomponents();
  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);

    return SafeArea(
        child: Scaffold(
      body: Container(
        height: sizes!.height,
        width: sizes!.width,
        color: AppColors.pureWhiteColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidgets.appBarIconImageText(
                  text: "Add Caregivers",
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
                    SizedBox(
                      height: getHeight() * 0.03,
                    ),
                    _addcaregiverscomponents.myAddCaregiver(
                      height: getHeight() * 0.6,
                      child: Padding(
                        padding: EdgeInsets.all(getHeight() * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView.size14Text('First Name',
                                color: AppColors.textColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: getHeight() * 0.01,
                            ),
                            _addcaregiverscomponents.mytextField(
                              hint: 'First Name',
                            ),
                            SizedBox(
                              height: getHeight() * 0.03,
                            ),
                            TextView.size14Text('Last Name',
                                color: AppColors.textColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: getHeight() * 0.01,
                            ),
                            _addcaregiverscomponents.mytextField(
                              hint: 'Last Name',
                            ),
                            SizedBox(
                              height: getHeight() * 0.03,
                            ),
                            TextView.size14Text('Email',
                                color: AppColors.textColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: getHeight() * 0.01,
                            ),
                            _addcaregiverscomponents.mytextField(
                              hint: 'Messi10@gmail.com',
                            ),
                            SizedBox(
                              height: getHeight() * 0.03,
                            ),
                            TextView.size14Text('Contact Number',
                                color: AppColors.textColor,
                                fontFamily: Assets.raleWaySemiBold,
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: getHeight() * 0.01,
                            ),
                            _addcaregiverscomponents.mytextField(
                              hint: '+123 456 789 00',
                            ),
                            SizedBox(
                              height: getHeight() * 0.02,
                            ),
                            _addcaregiverscomponents.myDivider(),
                            SizedBox(
                              height: getHeight() * 0.02,
                            ),
                            CommonWidgets.getButton(
                              onPress: () {},
                              text: 'Add Now',
                              height: getHeight() * 0.06,
                              fontFamily: Assets.raleWaySemiBold,
                              fontWeight: FontWeight.w600,
                              fontSize: sizes!.fontSize14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
