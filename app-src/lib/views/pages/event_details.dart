import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:invitation/core/models/event.dart';
import 'package:invitation/data/data.dart';
import 'package:invitation/styles/app_theme.dart';
import 'package:invitation/styles/text_styles.dart';
import 'package:invitation/utils/constants.dart';
import 'package:invitation/views/pages/events.dart';
import 'package:invitation/core/enums/enumeration.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatefulWidget {
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  EventModel event;
  @override
  Widget build(BuildContext context) {
    event = _getEvent();
    return Scaffold(
      backgroundColor: AppTheme.homeC1,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$bg/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 200,
          right: 40,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.grey.withOpacity(.6),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  event.title,
                  style: headline,
                  textAlign: TextAlign.left,
                ),
                _buildRow(Icons.calendar_today, event.dates),
                _buildRow(Icons.access_time, event.time),
                _buildRow(Icons.location_city, event.hallName),
                _buildRow(Icons.location_on, event.hallAddress),
                Text(
                  event.subTitle,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  event.description,
                  style: TextStyle(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildButton('Call', Icons.call, () {
                      launch("tel://7373732908");
                    }),
                    _buildButton('Map', Icons.location_on, () {
                      _launchMapsUrl(11.667199, 78.169500);
                    }),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, IconData icon, Function onPressed) {
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
          icon: Icon(icon),
          label: Text(text),
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: AppTheme.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: AppTheme.white),
          )
        ],
      ),
    );
  }

  void _launchMapsUrl(double lat, double lon) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  _getEvent() {
    if (EventsPage.event == Events.marriage)
      return events[1];
    else
      return events[0];
  }
}
