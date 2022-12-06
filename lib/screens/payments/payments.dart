

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/payments/payments_components.dart';
import 'package:we_skool_app/widgets/common_widgets.dart';

import '../../res/colors.dart';
import '../../utilities/Dailogbox.dart';

class WePayments extends StatelessWidget {
  const WePayments({super.key});

  @override
  Widget build(BuildContext context) {
    
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
                text: "Payments",
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
                
                  SizedBox(height: getHeight() * 0.03),
                  CommonWidgets.searchField(),
                  SizedBox(height: getHeight() * 0.02),
                  PaymentsComponents.mypaymentBox(
                    packagetitle: 'Explore',
                    email: 'Loremipsum@email.com',
                    packagedate: '11-01-2022',
                    status: 'Active',
                    expirydate: '11-01-2023',
                    onPressButton: () {
                      showAnimatedDialog(
                          context: context,

                          builder: (_) {
                        return const AlertDilog();
                      },
                      animationType: DialogTransitionType.none,
                      duration: const Duration(seconds: 1));
                    }
                  ),

          
          
                ],
              )
            ),
                ],
            ),
          )
        )
      ),
    );
  }
}