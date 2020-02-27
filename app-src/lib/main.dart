import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/views/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Invitation App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.buildLightTheme(),
      initialRoute: Router.initialRoute,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
