import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invitation/core/models/event.dart';
import 'package:invitation/data/data.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/views/components/cards/event.dart';
import 'package:invitation/views/components/header.dart';
import 'package:invitation/views/router.dart';
import 'package:invitation/core/enums/enumeration.dart';

class EventsPage extends StatefulWidget {
  static Events event = Events.none;
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> with TickerProviderStateMixin {
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
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('$bg/bg2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.grey.withOpacity(.1),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            HeaderView(
              title: 'Events',
            ),
            Expanded(
              child: _buildList(events),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildList(List<EventModel> events) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: events.length,
      padding: EdgeInsets.only(top: 8),
      itemBuilder: (context, index) {
        animationController.forward();
        return InkWell(
          onTap: () {
            EventsPage.event = events[index].event;
            Navigator.pushNamed(context, Router.eventDetails);
          },
          child: EventCard(event: events[index]),
        );
      },
    );
  }
}
