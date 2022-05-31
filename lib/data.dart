import 'package:clock_app/constant/theme_data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/model/alarm_info.dart';
import 'package:flutter/material.dart';
import 'menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: 'Office', gradientColor: GradientColors.sky),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2)),
      description: 'Sport', gradientColor: GradientColors.mango),
  AlarmInfo(DateTime.now().add(const Duration(hours: 3)),
      description: 'School', gradientColor: GradientColors.sunset),
];
