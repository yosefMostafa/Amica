import 'package:amica/Screens/Profile/Happinesspts.dart';
import 'package:amica/Screens/Profile/Notifications.dart';
import 'package:flutter/material.dart';

import 'package:amica/Screens/Profile/Progress.dart';

class Profilenavigation extends StatelessWidget {
  const Profilenavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: DefaultTabController(
          length: 3,
          child: Container(
            child: Expanded(
              child: Container(
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 46),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 2.0, color: Colors.black))),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        child: TabBar(
                          unselectedLabelColor: Colors.black.withOpacity(0.5),
                          labelColor: Colors.black.withOpacity(0.5),
                          tabs: [
                            Tab(
                              text: 'Progress',
                            ),
                            Tab(
                              text: 'Happiness pts',
                            ),
                            Tab(
                              text: 'Notifications',
                            )
                          ],
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorColor: Colors.yellow,
                        ),
                      ),
                    ]),
                    Expanded(
                        child: TabBarView(children: [
                      Progress(),
                      Happinesspts(),
                      Notifications(),
                    ]))
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
