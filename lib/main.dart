import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:we_skool_app/providers/multi_providers.dart';
import 'package:we_skool_app/routes/routes.dart';
import 'package:we_skool_app/screens/Blog%20Articles/blog_article_screen.dart';
import 'package:we_skool_app/screens/Misclaneous/misc.dart';
import 'package:we_skool_app/screens/Read/read_screen.dart';
import 'package:we_skool_app/screens/WeSpecials/wespecial.dart';
import 'package:we_skool_app/screens/contact_us/contact_us.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
    // git push
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        routes: Routes.routes,
        title: 'We Skool' ,
      
       
      ),
    );
  }
}

