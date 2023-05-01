import 'package:flutter/material.dart';

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
    return const MaterialApp(
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LMStheme.lightTheme,
      darkTheme: LMStheme.darkTheme,
      themeMode: ThemeMode.system,
>>>>>>> Stashed changes
      home: Splash(),
    );
  }
}
