import 'package:provider/provider.dart';
import 'package:we_skool_app/screens/bottomTab/bottom_tab_provider.dart';
import 'package:we_skool_app/screens/contact_us/contact_us_provider.dart';
import 'package:we_skool_app/screens/daily_schedule/daily_schedule_provider.dart';
import 'package:we_skool_app/screens/registration/parent_guardian_provider.dart';
import 'package:we_skool_app/screens/sign_in/sign_in_provider.dart';
import 'package:we_skool_app/screens/forgot_password/forgot_password_provider.dart';
import 'package:we_skool_app/screens/registration/registration_provider.dart';
import 'package:we_skool_app/screens/registration/child_information_provider.dart';
import 'package:we_skool_app/screens/registration/select_program_provider.dart';
import 'package:we_skool_app/screens/bottomTab/pages/daily_observation/daily_observation_provider.dart';
import 'package:we_skool_app/screens/monthly_framework/monthly_framework_provider.dart';
import 'package:we_skool_app/screens/we_monthly_schedule/we_monthly_provider.dart';

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
  ChangeNotifierProvider<DailyScheduleProvider>(
    create: (_) => DailyScheduleProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<RegistrationProvider>(
    create: (_) => RegistrationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ChildInformationProvider>(
    create: (_) => ChildInformationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<ParentGuardianProvider>(
    create: (_) => ParentGuardianProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<SelectProgramProvider>(
    create: (_) => SelectProgramProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<DailyObservationProvider>(
    create: (_) => DailyObservationProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<MonthlyFrameworkProvider>(
    create: (_) => MonthlyFrameworkProvider(),
    lazy: true,
  ),
  ChangeNotifierProvider<WeMonthlyProvider>(
    create: (_) => WeMonthlyProvider(),
    lazy: true,
  ),
];
