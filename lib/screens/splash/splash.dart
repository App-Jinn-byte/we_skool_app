import 'package:flutter/material.dart';
import 'package:we_skool_app/common/utils.dart';
import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/strings.dart';
import 'package:we_skool_app/animations/slide_right.dart';
import 'package:we_skool_app/screens/on_boarding1/on_boarding1.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  bool animated = false;

  @override
  void initState() {
    animateFork();
    PreferenceUtils.init();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // initializeResources(context: context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: sizes!.width,
          height: sizes!.height,
          // color: AppColors.appTheme,
          decoration:  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              // Positioned(
              //     top: getHeightRatio() * 70,
              //     left: getWidthRatio() * 50,
              //     child: Image.asset(
              //       Assets.logoSplash,
              //       width: getWidthRatio() * 250,
              //       height: getHeightRatio() * 100,
              //     )),
              AnimatedPositioned(
                top: animated ? getHeight()/6 : getHeight(),
                left: getWidth() / 4,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Image.asset(
                  Assets.splashLogo,
                  width: getWidthRatio() * 200,
                  height: getHeightRatio() * 400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void animateFork() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      animated = true;
    });
    await Future.delayed(const Duration(seconds: 3));
    if (PreferenceUtils.getString(Strings.fullName)!.isNotEmpty &&
        PreferenceUtils.getString(Strings.password)!.isNotEmpty) {
      Navigator.pushReplacement(context, SlideRightRoute(page: const OnBoarding1()));
    }
    else {
      Navigator.pushReplacement(context, SlideRightRoute(page: const OnBoarding1()));
    }
  }

}