import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Alarmbackground extends StatelessWidget {
  final mycolors = Mycolors();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: mycolors.tangora.withOpacity(0.9),
      ),
      Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 7,
        ),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/stars.png'),
                fit: BoxFit.fill)),
      ),
    ]);
  }
}
