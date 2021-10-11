import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Happinesspts extends StatefulWidget {
  const Happinesspts({Key? key}) : super(key: key);

  @override
  _HappinessptsState createState() => _HappinessptsState();
}

class _HappinessptsState extends State<Happinesspts> {
  final mycolors = Mycolors();
  List badges = [
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"},
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"},
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"},
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"},
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"},
    {"photo": 'assets/images/profile.png', "name": "Happiness Maker"}
  ];

  _circleView(String title1, String title2, BuildContext ctx) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          height: (MediaQuery.of(ctx).size.height / 12 * 2) / 2,
          width: (MediaQuery.of(ctx).size.height / 12 * 2) / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  (MediaQuery.of(ctx).size.height / 12 * 2) / 4),
              color: mycolors.rockblue),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "50",
                style: TextStyle(color: mycolors.fadeyellow),
              ),
              Text("Hps", style: TextStyle(color: mycolors.fadeyellow)),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title1,
              style: TextStyle(fontSize: 15),
            ),
            Text(
              title2,
              style: TextStyle(fontSize: 15),
            ),
          ],
        )
      ],
    );
  }

  _challenges(BuildContext ctx) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(ctx).size.height / 12 * 3,
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleView("Goal", "Tracking", ctx),
          _circleView("Goal", "Addition", ctx),
          _circleView("Challenge", "Completion", ctx),
          _circleView("Points", "Earned", ctx),
          _circleView("Amica", "Points", ctx),
        ],
      ),
    );
  }

  _badges(BuildContext ctx) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: MediaQuery.of(ctx).size.height / 12 * 5,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Badges",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (ctx, i) => _badgesbuilder(ctx, i),
                itemCount: badges.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  _badgesbuilder(BuildContext ctx, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      height: 60,
      padding: EdgeInsets.only(left: 5, right: 20, top: 5, bottom: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            mycolors.fadeyellow,
            mycolors.calypso.withOpacity(0.8)
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(badges[index]['photo']),
                    fit: BoxFit.fill)),
          ),
          Container(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              badges[index]["name"],
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          _challenges(context),
          _badges(context),
        ],
      ),
    );
  }
}
