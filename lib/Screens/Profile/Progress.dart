import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  final mycolors = Mycolors();
  double precentage = 0.85;

  _myView(String text, BuildContext ctx) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(ctx).size.height / 12 * 3.5,
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        color: Colors.transparent,
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [mycolors.fadeyellow, mycolors.rockblue])),
              child: text == "My Programmes"
                  ? _myprograms(ctx)
                  : _myactivities(ctx),
            )),
          ],
        ),
      ),
    );
  }

  _myactivities(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Compeleted",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "${this.precentage * 100}%",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Most Engaged",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "NA",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ],
    );
  }

  _myprograms(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircularPercentIndicator(
          radius: MediaQuery.of(ctx).size.width / 4,
          lineWidth: 5.0,
          progressColor: Colors.yellow,
          animationDuration: 1500,
          percent: this.precentage,
          backgroundColor: Colors.grey,
          animation: true,
          center: new Text(
            "${this.precentage * 100}%",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text(
          "Depression exercies",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          _myView("My Programmes", context),
          _myView("My Activities", context),
        ],
      ),
    );
  }
}
