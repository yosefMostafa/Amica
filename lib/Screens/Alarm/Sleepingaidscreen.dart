import 'package:amica/Widgets/Alarmbackground.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Sleepingaidscreen extends StatefulWidget {
  const Sleepingaidscreen({Key? key}) : super(key: key);

  @override
  _Sleepingaidscreen createState() => _Sleepingaidscreen();
}

class _Sleepingaidscreen extends State<Sleepingaidscreen> {
  final mycolors = Mycolors();
  List sleepingtipslist = [
    {"image": 'assets/images/logo5.png'},
    {"image": 'assets/images/logo5.png'},
    {"image": 'assets/images/logo5.png'},
    {"image": 'assets/images/logo5.png'},
    {}
  ];
  List sleepingtipsstories = [
    {"image": 'assets/images/logo5.png'},
    {}
  ];
  _sleepingTipsandstories(BuildContext ctx) {
    return Container(
      height: ((MediaQuery.of(ctx).size.height / 9) * 8) - 150,
      width: double.infinity,
      color: Colors.transparent,
      margin: EdgeInsets.only(
          top: MediaQuery.of(ctx).size.height / 9 + 50, left: 15, right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_sleepingTips(ctx), _sleepingStories(ctx)],
      ),
    );
  }

  _boxesign(String title, BuildContext ctx, List items) {
    return Container(
        height: (((MediaQuery.of(ctx).size.height / 9) * 8) - 150) / 2,
        width: double.infinity,
        child: Column(children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, color: mycolors.rockblue),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: mycolors.rockblue,
                      )),
                  // width: double.infinity,
                  child: Card(
                    color: Colors.transparent,
                    child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) => _listbuilder(ctx, i, items),
                      itemCount: items.length,
                    ),
                  )))
        ]));
  }

  _listbuilder(BuildContext ctx, int index, List items) {
    if (index == items.length - 1) {
      return Center(
          child: Container(
        margin: EdgeInsets.only(left: 20),
        height: 70,
        width: 70,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.black, Color.fromARGB(255, 47, 46, 46)]),
        ),
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ));
    }
    return Center(
        child: Container(
      margin: EdgeInsets.only(left: 20),
      height: 70,
      width: 70,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: mycolors.calypso,
          image: DecorationImage(
              image: AssetImage(items[index]["image"]), fit: BoxFit.fill)),
    ));
  }

  _sleepingTips(BuildContext ctx) {
    return _boxesign("Sleeping Tips", ctx, sleepingtipslist);
  }

  _sleepingStories(BuildContext ctx) {
    return _boxesign("Sleeping Stories", ctx, sleepingtipsstories);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Alarmbackground(),
        _sleepingTipsandstories(context),
      ],
    );
  }
}
