import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final mycolors = Mycolors();
  late DateTime lastmonday;
  List checkeddayswithemojies = [4, 3, 1, 5, 2, 5, 1];

  void initState() {
    // TODO: implement initState
    super.initState();
    _getlastmondaydate();
  }

  _getlastmondaydate() {
    var monday = 1;
    var now = new DateTime.now();

    while (now.weekday != monday) {
      now = now.subtract(new Duration(days: 1));
    }
    lastmonday = now;
    print(lastmonday);
  }

  _getreactions(BuildContext context) {
    Icon myicon = Icon(
      Icons.add,
      color: mycolors.calypso,
    );
    List<Reaction> reactions = [
      Reaction(
          previewIcon: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/emojies/happ1.png',
            ),
          ),
          icon: myicon),
      Reaction(
          previewIcon: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/emojies/cute.png',
            ),
          ),
          icon: myicon),
      Reaction(
          previewIcon: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/emojies/happy.png',
            ),
          ),
          icon: myicon),
      Reaction(
          previewIcon: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/emojies/angry.png',
            ),
          ),
          icon: myicon),
      Reaction(
          previewIcon: Container(
            width: MediaQuery.of(context).size.width / 7,
            height: MediaQuery.of(context).size.width / 7,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/emojies/sad.png',
            ),
          ),
          icon: myicon),
    ];
    return reactions;
  }

  // ignore: unused_element
  _box(
    BuildContext context,
    List mynumber, {
    int flag = 0,
    int checked = -1,
    Function? ontabhandler,
  }) {
    String emoji = '';
    Widget box = Container();
    if (flag == 1) {
      emoji = 'assets/images/emojies/happ1.png';
    } else if (flag == 2) {
      emoji = 'assets/images/emojies/cute.png';
    } else if (flag == 3) {
      emoji = 'assets/images/emojies/happy.png';
    } else if (flag == 4) {
      emoji = 'assets/images/emojies/angry.png';
    } else if (flag == 5) {
      emoji = 'assets/images/emojies/sad.png';
    }
    if (flag == 0 && mynumber[0] != 6) {
      box = Container(
        child: (checked == mynumber[0])
            ? Container(
                child: Icon(
                  Icons.circle,
                  color: mycolors.geyser,
                ),
              )
            : null,
      );
    } else if (mynumber[0] == 6) {
      if (mynumber[1] != 1) {
        DateFormat format = DateFormat("MMM");
        String month =
            format.format(lastmonday.add(Duration(days: mynumber[1] - 2)));
        DateTime day = lastmonday.add(Duration(days: mynumber[1] - 2));
        box = SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: day.day == DateTime.now().day
                    ? mycolors.calypso.withOpacity(0.5)
                    : null,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: mycolors.tangora, shape: BoxShape.circle),
                  child: FlutterReactionButtonCheck(
                    boxColor: mycolors.calypso.withOpacity(0.5),
                    onReactionChanged: (reaction, index, isChecked) {
                      print('reaction selected index: $index');
                      if (index != -1) {
                        print(day.weekday);
                        setState(() {
                          checkeddayswithemojies[day.weekday - 1] = index + 1;
                        });
                      }
                    },
                    reactions: _getreactions(context),
                    initialReaction: Reaction(
                      icon: Icon(
                        Icons.add,
                        color: mycolors.calypso,
                      ),
                    ),
                    selectedReaction: Reaction(
                        icon: Icon(
                      Icons.add,
                      color: mycolors.calypso,
                    )),
                  ),
                ),
                FittedBox(fit: BoxFit.contain, child: Text(month)),
                FittedBox(fit: BoxFit.contain, child: Text(day.day.toString())),
              ],
            ),
          ),
        );
      }
    } else {
      box = Container(
        margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(image: AssetImage(emoji), fit: BoxFit.fill),
        ),
      );
    }
    return Container(
        height: (MediaQuery.of(context).size.height / 12 * 6) / 6,
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                right: BorderSide(color: Colors.black.withOpacity(0.5)))),
        child: box);
  }

  // _day(BuildContext context) {
  //   return Container(
  //       margin: EdgeInsets.all(5),
  //       // width: (MediaQuery.of(context).size.height / 12 * 1.5) / 2,
  //       // height: (MediaQuery.of(context).size.height / 12 * 1.5) / 2,
  //       decoration:
  //           BoxDecoration(color: mycolors.tangora, shape: BoxShape.circle
  //               // borderRadius: BorderRadius.circular(
  //               //     (MediaQuery.of(context).size.height / 12 * 1.5) / 1),
  //               ));
  // }

  _grid(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _box(context, [1, 1], flag: 1),
          _box(
            context,
            [1, 2],
            checked: checkeddayswithemojies[0],
          ),
          _box(
            context,
            [1, 3],
            checked: checkeddayswithemojies[1],
          ),
          _box(
            context,
            [1, 4],
            checked: checkeddayswithemojies[2],
          ),
          _box(
            context,
            [1, 5],
            checked: checkeddayswithemojies[3],
          ),
          _box(
            context,
            [1, 6],
            checked: checkeddayswithemojies[4],
          ),
          _box(
            context,
            [1, 7],
            checked: checkeddayswithemojies[5],
          ),
          _box(
            context,
            [1, 8],
            checked: checkeddayswithemojies[6],
          ),
          _box(context, [2, 1], flag: 2),
          _box(
            context,
            [2, 2],
            checked: checkeddayswithemojies[0],
          ),
          _box(
            context,
            [2, 3],
            checked: checkeddayswithemojies[1],
          ),
          _box(
            context,
            [2, 4],
            checked: checkeddayswithemojies[2],
          ),
          _box(
            context,
            [2, 5],
            checked: checkeddayswithemojies[3],
          ),
          _box(
            context,
            [2, 6],
            checked: checkeddayswithemojies[4],
          ),
          _box(
            context,
            [2, 7],
            checked: checkeddayswithemojies[5],
          ),
          _box(
            context,
            [2, 8],
            checked: checkeddayswithemojies[6],
          ),
          _box(context, [3, 1], flag: 3),
          _box(
            context,
            [3, 2],
            checked: checkeddayswithemojies[0],
          ),
          _box(
            context,
            [3, 3],
            checked: checkeddayswithemojies[1],
          ),
          _box(
            context,
            [3, 4],
            checked: checkeddayswithemojies[2],
          ),
          _box(
            context,
            [3, 5],
            checked: checkeddayswithemojies[3],
          ),
          _box(
            context,
            [3, 6],
            checked: checkeddayswithemojies[4],
          ),
          _box(
            context,
            [3, 7],
            checked: checkeddayswithemojies[5],
          ),
          _box(
            context,
            [3, 8],
            checked: checkeddayswithemojies[6],
          ),
          _box(context, [4, 1], flag: 4),
          _box(
            context,
            [4, 2],
            checked: checkeddayswithemojies[0],
          ),
          _box(
            context,
            [4, 3],
            checked: checkeddayswithemojies[1],
          ),
          _box(
            context,
            [4, 4],
            checked: checkeddayswithemojies[2],
          ),
          _box(
            context,
            [4, 5],
            checked: checkeddayswithemojies[3],
          ),
          _box(
            context,
            [4, 6],
            checked: checkeddayswithemojies[4],
          ),
          _box(
            context,
            [4, 7],
            checked: checkeddayswithemojies[5],
          ),
          _box(
            context,
            [4, 8],
            checked: checkeddayswithemojies[6],
          ),
          _box(context, [5, 1], flag: 5),
          _box(
            context,
            [5, 2],
            checked: checkeddayswithemojies[0],
          ),
          _box(
            context,
            [5, 3],
            checked: checkeddayswithemojies[1],
          ),
          _box(
            context,
            [5, 4],
            checked: checkeddayswithemojies[2],
          ),
          _box(
            context,
            [5, 5],
            checked: checkeddayswithemojies[3],
          ),
          _box(
            context,
            [5, 6],
            checked: checkeddayswithemojies[4],
          ),
          _box(
            context,
            [5, 7],
            checked: checkeddayswithemojies[5],
          ),
          _box(
            context,
            [5, 8],
            checked: checkeddayswithemojies[6],
          ),
          _box(context, [6, 1]),
          _box(context, [6, 2], ontabhandler: () {}),
          _box(context, [6, 3], ontabhandler: () {}),
          _box(context, [6, 4], ontabhandler: () {}),
          _box(context, [6, 5], ontabhandler: () {}),
          _box(context, [6, 6], ontabhandler: () {}),
          _box(context, [6, 7], ontabhandler: () {}),
          _box(context, [6, 8], ontabhandler: () {}),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: (MediaQuery.of(context).size.height / 12 * 6) / 6 - 5,
          crossAxisCount: 8,
          crossAxisSpacing: 5,
          // mainAxisSpacing: 5,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(children: [
        Container(
          alignment: Alignment.center,
          child: Text("MOOD INSIGHTS", style: TextStyle(fontSize: 30)),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, top: 20),
          alignment: Alignment.centerLeft,
          child: Text("MOOD HISTORY", style: TextStyle(fontSize: 20)),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 20),
          height: MediaQuery.of(context).size.height / 12 * 6,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 12 * 6,
                  color: Colors.transparent,
                  child: _grid(context)),
              // Container(
              //     width: double.infinity,
              //     height: MediaQuery.of(context).size.height / 12 * 1.5,
              //     color: Colors.transparent,
              //     child: GridView(
              //         padding: EdgeInsets.all(0),
              //         shrinkWrap: true,
              //         physics: NeverScrollableScrollPhysics(),
              //         children: [
              //           _day(context),
              //         ],
              //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           mainAxisExtent:
              //               (MediaQuery.of(context).size.height / 12 * 4.5) / 5 - 5,
              //           crossAxisCount: 8,
              //           crossAxisSpacing: 5,
              //           // mainAxisSpacing: 5,
              //         ))),
            ],
          ),
        ),
      ])),
    );
  }
}
