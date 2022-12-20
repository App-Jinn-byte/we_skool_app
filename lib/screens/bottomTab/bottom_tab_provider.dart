import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/screens/bottomTab/pages/calendar/calendar.dart';
import 'package:we_skool_app/screens/bottomTab/pages/chat/chat.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation.dart';
import 'package:we_skool_app/screens/bottomTab/pages/home/home.dart';
import 'package:we_skool_app/screens/bottomTab/pages/notification/notification.dart';
import 'package:we_skool_app/screens/contact_us/contact_us.dart';



class BottomTabProvider extends ChangeNotifier {
  int selectedIndex = 0;
  BuildContext? context;
  bool hideBottomTab = false;

  init({@required BuildContext? context, @required int? index}) {
    selectedIndex = index!;
    // hideBottomTab = false;
    this.context = context;
  }

  set setCurrentIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List screens = [
    const Home(),
    DailyObservation(),
    const Calendar(),
    const NotificationScreen(),
    const ContactUs()
  ];
}

