// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:we_skool_app/common/utils.dart';

import 'package:we_skool_app/res/res.dart';
import 'package:we_skool_app/res/assets.dart';
import 'package:we_skool_app/res/strings.dart';

import '../../animations/slide_right.dart';
import '../on_boarding1/on_boarding1.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      value: 0.1,
    );
    
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc);
    PreferenceUtils.init();
    _controller.forward();
    nextScreenAutoMove();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initializeResources(context: context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: sizes!.width,
          height: sizes!.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.backGroundImage), fit: BoxFit.fill),
          ),
          child: ScaleTransition(
            scale: _animation,
            alignment: Alignment.center,
            child: Center(
              child: Image.asset(
                Assets.logo,
                width: getWidthRatio() * 285,
                height: getHeightRatio() * 150,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void nextScreenAutoMove() async {
    await Future.delayed(const Duration(seconds: 6));
    if (PreferenceUtils.getString(Strings.fullName)!.isNotEmpty &&
        PreferenceUtils.getString(Strings.password)!.isNotEmpty) {
      Navigator.pushReplacement(
          context, SlideRightRoute(page: const OnBoarding1()));
    } else {
      Navigator.pushReplacement(
          context, SlideRightRoute(page: const OnBoarding1()));
    }
  }
}
