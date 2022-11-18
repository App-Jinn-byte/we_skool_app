
import 'package:flutter/cupertino.dart';

class SplashProvider extends ChangeNotifier {
  BuildContext? context;
  init({@required BuildContext? context}) {
    this.context = context;
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(
      seconds: 3,
    ));
    // Navigator.pushReplacement(
    //     context!, SlideRightRoute(page: const IntroScreen1()));
  }
}
