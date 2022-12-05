import 'package:provider/provider.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab_provider.dart';
import 'package:we_skool_app/screens/splash/splash_provider.dart';

final multiProviders = [
  // ChangeNotifierProvider<SplashProvider>(
  //   create: (_) => SplashProvider(),
  //   lazy: true,
  // ),
  ChangeNotifierProvider<BottomTabProvider>(
    create: (_) => BottomTabProvider(),
    lazy: true,
  ),
];
