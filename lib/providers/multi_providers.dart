import 'package:provider/provider.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab_provider.dart';
import 'package:we_skool_app/screens/contact_us/contact_us_provider.dart';


final multiProviders = [
  // ChangeNotifierProvider<SplashProvider>(
  //   create: (_) => SplashProvider(),
  //   lazy: true,
  // ),
  ChangeNotifierProvider<BottomTabProvider>(
    create: (_) => BottomTabProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ContactUsProvider>(
    create: (_) => ContactUsProvider(),
    lazy: true,
  ),
];
