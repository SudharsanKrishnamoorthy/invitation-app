import 'package:flutter/material.dart';
import 'package:invitation/core/models/favourite.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/utils/ui_helper.dart';

class FavouriteCard extends StatelessWidget {
  final Favourites fav;
  FavouriteCard({this.fav});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          _buildContent(),
          _buildImage(),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.circular(15)),
        width: UIHelper.screenWidth * .3,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(fav.image),
            ),
            Text(
              fav.title,
              style: body1,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Positioned(
      top: 15,
      right: 10,
      child: Container(
        height: 170,
        width: UIHelper.screenWidth * .65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.only(left: 30, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('$assetProfile/groom.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(fav.groom),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(fav.bride),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('$assetProfile/bride.jpg'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
