import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/on_boarding1/on_boarding1_components.dart';
import 'package:we_skool_app/res/colors.dart';

import '../../res/strings.dart';
import '../sign_in/sign_in.dart';

class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  _OnBoarding2State createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  final OnBoarding1Components _onBoarding1Components = OnBoarding1Components();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: sizes!.height,
            width: sizes!.width,
            decoration: const BoxDecoration(
                color: AppColors.pureWhiteColor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: getHeight() * 0.6,
                  width: getWidth(),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.onBoarding2), fit: BoxFit.fill
                      )),
                ),
                _onBoarding1Components.onBoardingContainer(
                    heading: "Designed For You",
                    description: Strings.onBoarding2Text,
                    buttonText: "Get Started",
                    circle1Color: AppColors.pureWhiteColor,
                    circle2Color: AppColors.pinkColor,
                    onPressButton: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SignIn()));
                    }
                ),
              ],
            )),
      ),
    );
  }
}
