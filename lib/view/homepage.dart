import 'package:clock_app/constant/theme_data.dart';
import 'package:clock_app/data.dart';
import 'package:clock_app/enum.dart';
import 'package:clock_app/view/alarm_page.dart';
import 'package:clock_app/view/clock_page.dart';
import 'package:clock_app/view/clock_view.dart';
import 'package:clock_app/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                  .toList(),
            ),
            VerticalDivider(
              color: Colors.white54,
              width: 1,
            ),
            Expanded(
              child: Consumer<MenuInfo>(
                builder: (BuildContext context, MenuInfo value, Widget? child) {
                  if(value.menuType == MenuType.clock){
                    return const ClockPage();
                  }else if(value.menuType == MenuType.alarm){
                    return const AlarmPage();
                  }else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return TextButton(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 14.0, horizontal: 3.0),
              ),
              backgroundColor: currentMenuInfo.menuType == value.menuType
                  ? MaterialStateProperty.all(CustomColors.menuBackgroundColor)
                  : MaterialStateProperty.all(Colors.transparent)),
          onPressed: () {
            ////todo
            MenuInfo menuIndo = Provider.of<MenuInfo>(context, listen: false);
            menuIndo.updateMenuInfo(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource ?? "",
                scale: 1.5,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                currentMenuInfo.title ?? "Title",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'avenir',
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
