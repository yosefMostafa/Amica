import 'package:amica/Screens/Alarm/Alarm.dart';
import 'package:amica/Screens/Alarm/Sleepingaidscreen.dart';

import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Alarmscreen extends StatefulWidget {
  const Alarmscreen();

  @override
  _AlarmscreenState createState() => _AlarmscreenState();
}

class _AlarmscreenState extends State<Alarmscreen> {
  final mycolors = Mycolors();
  int pageflag = 1;
  Widget _getpage() {
    if (pageflag == 1) {
      return Alarm();
    } else {
      return Sleepingaidscreen();
    }
  }

  _selectscreen(BuildContext ctx) {
    if (pageflag == 1) {
      setState(() {
        pageflag = 0;
      });
    } else {
      setState(() {
        pageflag = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _getpage(),
        Container(
            padding: EdgeInsets.fromLTRB(15, 5, 5, 5),
            height: 40,
            width: MediaQuery.of(context).size.width - 100,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 9, left: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: mycolors.tangora.withOpacity(0.8),
            ),
            child: InkWell(
              onTap: () => _selectscreen(context),
              child: Stack(
                children: [
                  Text(
                    "Sleeping aid",
                    style: TextStyle(
                      fontSize: 20,
                      color: mycolors.rockblue,
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 5.0,
                    child: Icon(
                      pageflag == 1
                          ? Icons.play_circle_outline
                          : Icons.play_circle_filled_outlined,
                      color: mycolors.rockblue,
                    ),
                  ),
                ],
              ),
            )),
      ]),
    );
  }
}
