import 'package:attendance_app/core/utils/size_utils.dart';
import 'package:attendance_app/firebase_options.dart';
import 'package:attendance_app/routes/app_routes.dart';
import 'package:attendance_app/theme/theme_helper.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //       options: FirebaseOptions(
  //           apiKey: Constants.apiKey,
  //           appId: Constants.appId,
  //           messagingSenderId: Constants.messagingSenderId,
  //           projectId: Constants.projectId));
  // } else {
  //   await Firebase.initializeApp();
  // }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'attendance_app',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.androidLarge1HomeScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
