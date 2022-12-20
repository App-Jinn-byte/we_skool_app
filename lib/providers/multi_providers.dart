import 'package:provider/provider.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab_provider.dart';
import 'package:we_skool_app/screens/contact_us/contact_us_provider.dart';
import 'package:we_skool_app/screens/sign_in/sign_in_provider.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password_provider.dart';

final multiProviders = [
  ChangeNotifierProvider<BottomTabProvider>(
    create: (_) => BottomTabProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ContactUsProvider>(
    create: (_) => ContactUsProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SignInProvider>(
    create: (_) => SignInProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ForgotPasswordProvider>(
    create: (_) => ForgotPasswordProvider(),
    lazy: true,
  ),
];
