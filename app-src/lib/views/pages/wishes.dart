import 'package:flutter/material.dart';
import 'package:invitation/core/models/wishes.dart';
import 'package:invitation/data/data.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/ui_helper.dart';
import 'package:invitation/views/components/header.dart';

import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:convert';


class WishesPage extends StatefulWidget {
  @override
  _WishesPageState createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> with TickerProviderStateMixin {
  AnimationController animationController;
  int selectedIndex = 0;
  List<WishesModel> wishes =[];

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
      body: _buildBody1(),
    );
  }

  Widget _bgPhoto() {
    if(wishes.length == 0) {
      return SizedBox();
    }
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(wishes[selectedIndex].image),
                fit: BoxFit.cover
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.black.withOpacity(.1),
              ),
            ),
          ),
        ),
        Positioned.fill(child: _buildBody())
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        HeaderView(
          title: 'Wishes',
          isLight: true,
        ),
        Expanded(
          child: _buildContent(),
        )
      ],
    );
  }

  Widget _buildContent() {
    return Row(
      children: <Widget>[
        _buildUsersList(wishes),
        _buildDetails(),
      ],
    );
  }

  Future<List> fetchData() async {
    //the link you want to data from, goes inside get
    final response = await http.get(
      'https://raw.githubusercontent.com/SudharsanKrishnamoorthy/invitation-app/master/gallery/wishes/wishes.json',
    );

    if (response.statusCode == 200) {
      wishes =(json.decode(response.body) as List).map((i) =>
              WishesModel.fromJson(i)).toList();
      return json.decode(response.body);
      }
    return [];
  }

  Widget _buildBody1() {
    return FutureBuilder<List>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: _bgPhoto()
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          ); 
        }
      },
    );
  }

  Widget _buildUsersList(List<WishesModel> wishes) {
    return Container(
      color: AppTheme.primaryColor.withOpacity(.1),
      width: UIHelper.screenWidth * .2,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: wishes.length,
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          animationController.forward();
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                    wishes[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetails() {
    return Container(
      width: UIHelper.screenWidth * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _header(),
          _buildWishes(),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(''),
              Text(
                wishes[selectedIndex].name,
                style: title.copyWith(fontSize: 30, color: AppTheme.white),
              ),
              Text(wishes[selectedIndex].relation, style: TextStyle(color: AppTheme.nearlyWhite),)
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(
                  wishes[selectedIndex].image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishes() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: UIHelper.screenWidth * .7,
        height: UIHelper.screenHeight * .57,
        child: Card(
          color: AppTheme.nearlyBlack.withOpacity(.2),
          elevation: 20,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Text(
                  wishes[selectedIndex].text,
                  style: body2.copyWith(color:AppTheme.nearlyWhite),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
