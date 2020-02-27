import 'package:flutter/material.dart';
import 'package:invitation/core/models/favourite.dart';
import 'package:invitation/data/data.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/views/components/cards/favourite.dart';
import 'package:invitation/views/components/header.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.homeC1,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        HeaderView(
          title: 'Favoutites',
        ),
        Expanded(child: _buildList(favourites))
      ],
    );
  }

  Widget _buildList(List<Favourites> fav) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: fav.length,
      padding: EdgeInsets.only(top: 8),
      itemBuilder: (context, index) {
        animationController.forward();
        return FavouriteCard(fav: fav[index],);
      },
    );
  }
}
