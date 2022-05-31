import 'package:flutter/material.dart';

class AlarmInfo{
  late DateTime alarmDateTime;
  String? description;
  bool? isActive;
  List<Color>? gradientColor;

  AlarmInfo(this.alarmDateTime,{this.description, this.gradientColor});
}