import 'package:flutter/material.dart';
import '../presentation/android_large_1_home_screen/android_large_1_home_screen.dart';
import '../presentation/android_large_1_login_screen/android_large_1_login_screen.dart';
import '../presentation/android_large_1_register_screen/android_large_1_register_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String androidLarge1HomeScreen = '/android_large_1_home_screen';

  static const String androidLarge1LoginScreen =
      '/android_large_1_login_screen';

  static const String androidLarge1RegisterScreen =
      '/android_large_1_register_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    androidLarge1HomeScreen: (context) => AndroidLarge1HomeScreen(),
    androidLarge1LoginScreen: (context) => LoginPage(),
    androidLarge1RegisterScreen: (context) => AndroidLarge1RegisterScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
