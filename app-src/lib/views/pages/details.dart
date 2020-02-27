import 'package:flutter/material.dart';
import 'package:invitation/core/models/couple.dart';
import 'package:invitation/data/data.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/utils/ui_helper.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  CoupleModel detail = weddedCouple[1];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.homeC1,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 100,
          left: 25,
          right: 80,
          bottom: 200,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: AssetImage(detail.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          right: 0,
          left: UIHelper.screenWidth * .55,
          bottom: 250,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Text(
                detail.description,
                style: caption,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                detail.name,
                style: wishText,
              ),
              Text(detail.designation),
            ],
          ),
        ),
        Positioned(
          left: 30,
          bottom: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildButton('Bride', () {
                setState(() {
                  detail = weddedCouple[1];
                });
              }),
              _buildButton('Groom', () {
                setState(() {
                  detail = weddedCouple[0];
                });
              }),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            child: Image.asset('$assetBG/pic5.png'),
            height: 190,
          ),
        )
      ],
    );
  }

  Widget _buildButton(String text, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 35,
        child: FlatButton.icon(
          onPressed: onPressed,
          icon: SizedBox(),
          label: Text(text),
        ),
      ),
    );
  }
}
