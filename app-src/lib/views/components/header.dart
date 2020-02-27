import 'package:flutter/material.dart';
import 'package:invitation/styles/text_styles.dart';

class HeaderView extends StatelessWidget {
  final String title;
  final bool isLight;
  HeaderView({this.title, this.isLight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Text(
        title,
        style: !isLight ? display1: display1.copyWith(color: Colors.white),
      ),
    );
  }
}
