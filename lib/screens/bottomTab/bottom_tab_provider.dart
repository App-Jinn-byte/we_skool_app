import 'package:flutter/cupertino.dart';
import 'package:we_skool_app/screens/bottomTab/pages/calendar/calendar.dart';
import 'package:we_skool_app/screens/bottomTab/pages/chat/chat.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation.dart';
import 'package:we_skool_app/screens/bottomTab/pages/home/home.dart';
import 'package:we_skool_app/screens/bottomTab/pages/notification/notification.dart';



class BottomTabProvider extends ChangeNotifier {
  int selectedIndex = 0;
  BuildContext? context;

  init({@required BuildContext? context, @required int? index}) {
    this.context = context;
    selectedIndex = index!;
  }

  set setCurrentIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List screens = [
    const Home(),
    const Chat(),
    const Calendar(),
    const NotificationScreen(),
    DailyObservation()
  ];
}

