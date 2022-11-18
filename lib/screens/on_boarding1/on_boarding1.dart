import 'package:flutter/material.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/screens/on_boarding1/on_boarding1_components.dart';
import 'package:we_skool_app/res/colors.dart';
import 'package:we_skool_app/screens/on_boarding2/on_boarding2.dart';
import '../../res/strings.dart';


class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  _OnBoarding1State createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
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
                          image: AssetImage(Assets.onBoarding1), fit: BoxFit.fill
                      )),
                ),
                _onBoarding1Components.onBoardingContainer(
                    heading: "Made For Children",
                    description: Strings.onBoarding1Text,
                    buttonText: "Next",
                    onPressButton: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const OnBoarding2()));
                    }
                ),
              ],
            )),
      ),
    );
  }
}
