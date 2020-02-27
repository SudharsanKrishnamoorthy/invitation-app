import 'package:invitation/core/enums/enumeration.dart';

class EventModel {
  String title;
  String image;
  String dates;
  String date;
  String month;
  String time;
  String hallName;
  String hallAddress;
  String subTitle;
  String description;
  bool isSelected;
  Events event;
  
  EventModel({
    this.title,
    this.image,
    this.dates,
    this.date,
    this.month,
    this.time,
    this.hallName,
    this.subTitle,
    this.hallAddress,
    this.description,
    this.isSelected,
    this.event,
  });
}
