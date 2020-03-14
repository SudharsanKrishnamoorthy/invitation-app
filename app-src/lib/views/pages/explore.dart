import 'package:flutter/material.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/utils/ui_helper.dart';
import 'package:invitation/views/components/menu_button.dart';
import 'package:invitation/views/router.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _buildImage(),
        _buildMenus(),
        _buildFooter(),
      ],
    );
  }

  Widget _buildImage() {
    return Positioned.fill(
      child: Image.asset(
        '$assetBG/pic2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMenus() {
    return Positioned(
      right: 20,
      bottom: 180,
      child: Container(
        width: 160,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuButton(
                  child: Icon(
                    Icons.supervisor_account,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.details);
                  },
                ),
                MenuButton(
                  child: Icon(
                    Icons.favorite,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.favourite);
                  },
                ),
                MenuButton(
                  child: Icon(
                    Icons.supervisor_account,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.wishes);
                  },
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MenuButton(
                  child: Icon(
                    Icons.event,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.events);
                  },
                ),
                MenuButton(
                  child: Icon(
                    Icons.photo,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.album);
                  },
                ),
                MenuButton(
                  child: Icon(
                    Icons.ondemand_video,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Router.video);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 120,
        width: UIHelper.screenWidth * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
          color: AppTheme.dismissibleBackground.withOpacity(.5),
        ),
        child: Center(
          child: Text(
            'A successful marriage requires falling in love many times, always with the same person',
            textAlign: TextAlign.center,
            style: body1.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
