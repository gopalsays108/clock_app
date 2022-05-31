import 'package:clock_app/view/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    String formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneOffset = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneOffset.startsWith('-')) offsetSign = '+';

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight, // strictly want size
            child: Text(
              'Clock',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'avenir',
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontFamily: 'avenir',
                  ),
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'avenir',
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Align(
              alignment: Alignment.center,
              child: ClockView(
                  size: MediaQuery
                      .of(context)
                      .size
                      .height / 4),
            ),
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Timezone',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'avenir',
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'UTC $offsetSign $timezoneOffset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'avenir',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );;
  }
}
