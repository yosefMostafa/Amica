import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final mycolors = Mycolors();
  double precentage = 0.85;
  List badges = [
    {
      "photo": 'assets/images/profile.png',
    },
    {
      "photo": 'assets/images/profile.png',
    },
    {
      "photo": 'assets/images/profile.png',
    },
    {
      "photo": 'assets/images/profile.png',
    },
    {
      "photo": 'assets/images/profile.png',
    },
    {
      "photo": 'assets/images/profile.png',
    },
  ];

  _myView(String text, BuildContext ctx) {
    return Container(
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
            child: text == "My Badges" ? _myBadges(ctx) : _myNetwork(ctx),
          )),
        ],
      ),
    );
  }

  _myNetwork(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Num offollowers",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Followers",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Suggested",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "friends",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "num following",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "following",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "name",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ],
    );
  }

  _myBadges(BuildContext ctx) {
    return Container(
      height: MediaQuery.of(ctx).size.height / 11,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) => _badgesbuilder(ctx, i),
        itemCount: badges.length,
      ),
    );
  }

  _badgesbuilder(BuildContext ctx, int index) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      // height: 70,
      width: MediaQuery.of(ctx).size.height / 11,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(badges[index]['photo']), fit: BoxFit.fill)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _myView("My Badges", context),
            _myView("My Network", context),
          ],
        ),
      ),
    );
  }
}
