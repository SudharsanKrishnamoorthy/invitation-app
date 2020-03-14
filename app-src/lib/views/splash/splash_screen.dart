import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/utils/ui_helper.dart';
import 'package:invitation/views/router.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _visible = true;

  AnimationController animationController;
  Animation<double> animation;
  
  startTime() async {
    var _duration = Duration(seconds: 7);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
     Navigator.of(context).pushReplacementNamed(Router.home);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    UIHelper.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Center(
                child: Text('Invitation', style: splashTitle),
              ),
            ),
            Expanded(child: Image.asset('$assetSplash/faces.gif')),
            Text(
              'Powered By',
              style: splashFooter,
            ),
            Text(
              'P3S2M1',
              style: splashFooter1,
            )
          ],
        ),
      ),
    );
  }
}
