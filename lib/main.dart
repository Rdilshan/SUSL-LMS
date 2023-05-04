import 'package:flutter/material.dart';
import 'package:flutter_application_5/lecturer/createnew.dart';
import 'package:flutter_application_5/myaccount/myaccount.dart';
import 'package:flutter_application_5/screen/MyCourses.dart';
import 'package:flutter_application_5/screen/homepage.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';

<<<<<<< Updated upstream
=======
import 'package:flutter_application_5/notifications/notifications.dart';
import 'package:flutter_application_5/submit_assignment/assignment.dart';

import 'Src/theme/theme.dart';
>>>>>>> Stashed changes
import 'screen/splash.dart';
import 'notifications/notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    return const MaterialApp(
=======
=======
>>>>>>> Stashed changes
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LMStheme.lightTheme,
      darkTheme: LMStheme.darkTheme,
      themeMode: ThemeMode.system,
<<<<<<< Updated upstream
>>>>>>> Stashed changes
      home: Splash(),
=======
      home: assignment(),
>>>>>>> Stashed changes
    );
  }
}
