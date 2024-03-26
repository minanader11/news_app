import 'package:flutter/material.dart';
import 'package:news_app/core/app_config_provider.dart';
import 'package:news_app/core/category_provider.dart';
import 'package:news_app/core/my_theme.dart';
import 'package:news_app/core/navigation_provider.dart';
import 'package:news_app/core/source_provider.dart';

import 'package:news_app/screens/home_screen/presentaion/views/home_screen.dart';
import 'package:news_app/screens/home_screen/presentaion/views/news_details.dart';
import 'package:news_app/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppConfigProvider(),),
    ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
    ),
    ChangeNotifierProvider(create: (context) => CategoryProvider(),),
    ChangeNotifierProvider(create: (context) => SourceProvider(),)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),

      },
      theme: MyTheme.lightTheme,
    );
  }
}
