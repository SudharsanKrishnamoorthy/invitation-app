import 'package:flutter/material.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/utils/ui_helper.dart';
import 'package:invitation/views/components/count_down_timer.dart';
import 'package:invitation/views/router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildBG(),
          Positioned(
            top: UIHelper.screenHeight * .07,
            right: 25,
            left: 25,
            child: Container(
              height: UIHelper.screenHeight * .65,
              width: UIHelper.screenWidth * .8,
              child: _buildPhotoStack(),
            ),
          ),
          _buildTimer(),
          _buidExploreButton(),
          _buidDate(),
        ],
      ),
    );
  }

  Widget _buildPhotoStack() {
    return Stack(
      children: <Widget>[
        _buildInnerBG(),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                child: Image.asset(
                  '$assetBG/pic1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 50,
          left: 50,
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  'Sudharsan',
                  style: splashTitle,
                ),
                Text(
                  'WEDS',
                  style: splashTitle.copyWith(
                      fontSize: 12,
                      fontFamily: AppTheme.fontName,
                      letterSpacing: 3),
                ),
                Text(
                  'Nandhini',
                  style: splashTitle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    var dat = new DateTime(2020, DateTime.may, 24, 12, 0);
    var dt = dat.difference(DateTime.now()).inSeconds;
    return Positioned(
      top: UIHelper.screenHeight * .72,
      height: UIHelper.screenHeight * .15,
      child: Container(
        height: UIHelper.screenHeight * .15,
        width: UIHelper.screenWidth,
        child: Container(
          width: 60.0,
          padding: EdgeInsets.only(top: 3.0, right: 4.0),
          child: CountDownTimer(
            secondsRemaining: dt,
          ),
        ),
      ),
    );
  }

  Widget _buidExploreButton() {
    return Positioned(
      bottom: UIHelper.screenHeight * .017,
      right: UIHelper.screenHeight * .017,
      child: Container(
        height: 40,
        width: 130,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: RaisedButton(
          color: AppTheme.homeC2.withOpacity(.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Explore'),
              Icon(Icons.chevron_right),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, Router.explore);
          },
        ),
      ),
    );
  }

  Widget _buidDate() {
    return Positioned(
      bottom: UIHelper.screenHeight * .017,
      left: UIHelper.screenHeight * .017,
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '24.05.2020',
              style: TextStyle(
                color: AppTheme.homeC1,
                fontSize: 35,
                fontFamily: 'GreatVibes',
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBG() {
    return Container(
      child: Row(
        children: <Widget>[
          _buildContainer(AppTheme.homeC2, UIHelper.screenWidth / 2),
          _buildContainer(AppTheme.homeC1, UIHelper.screenWidth / 2),
        ],
      ),
    );
  }

  Widget _buildInnerBG() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Row(
        children: <Widget>[
          _buildContainer(AppTheme.homeC1, ((UIHelper.screenWidth - 50) / 2)),
          _buildContainer(AppTheme.homeC2, ((UIHelper.screenWidth - 50) / 2)),
        ],
      ),
    );
  }

  Widget _buildContainer(Color color, double width) {
    return Container(
      height: UIHelper.screenHeight,
      width: width,
      color: color,
    );
  }
}
