import 'package:amica/Screens/Alarm/AlarmScreen.dart';
import 'package:amica/Screens/Home/HomePage.dart';
//import 'package:amica/Screens/Alram/Sleepingaidscreen.dart';
import 'package:amica/Screens/Stats/StatsmainScreen.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

import 'package:amica/Screens/Drawer/Drawerwidget.dart';

class Mainnavigation extends StatefulWidget {
  const Mainnavigation({Key? key}) : super(key: key);

  @override
  _MainnavigationState createState() => _MainnavigationState();
}

final GlobalKey<ScaffoldState> _globalkey = GlobalKey<ScaffoldState>();

class _MainnavigationState extends State<Mainnavigation> {
  final mycolors = Mycolors();
  int _selectedscreen = 0; //Home page
  PageController pagecontroller = PageController();

  _selectScreen(int index) {
    setState(() {
      _selectedscreen = index;
    });

    pagecontroller.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  _onWillPop() async {
    // Use this code if you just want to go back to 0th index
    if (_selectedscreen == 0) return true;
    setState(() {
      _selectedscreen = 0;
    });
    pagecontroller.jumpToPage(_selectedscreen);
    return false;

/* below code keeps track of all the navigated indexes*/
    //   if(_navigationQueue.isEmpty)
    //     return true;

    //   setState(() {
    //     index = _navigationQueue.last;
    //     _navigationQueue.removeLast();
    //   });
    //   return false;
    // },
  }

  _opendrawer() {
    _globalkey.currentState?.openDrawer();
  }

  _logocontainer() {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 2 - 25,
          MediaQuery.of(context).size.height - 75, 0, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: mycolors.calypso,
          image: DecorationImage(
              image: AssetImage('assets/images/logo5.png'), fit: BoxFit.fill)),
      child: InkWell(
        onTap: () {}, //on tapping the logo chat bot
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => _onWillPop(),
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
              drawer: Drawerwidget(),
              key: _globalkey,
              body: Stack(children: [
                Scaffold(
                    extendBody: true,
                    body: Stack(
                      children: [
                        PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: pagecontroller,
                          children: [
                            MyHomePage(title: "Amica1"),
                            Alarmscreen(), //default for alarm page
                            Statsmainscreen(),
                            MyHomePage(title: "Amica4"),
                          ],
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                left: 10,
                                top: MediaQuery.of(context).padding.top + 5),
                            child: IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () => _opendrawer(),
                            )),
                      ],
                    ),
                    bottomNavigationBar: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                            child: BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              backgroundColor: mycolors.tangora,
                              selectedFontSize: 15.0,
                              currentIndex: _selectedscreen,
                              onTap: _selectScreen,
                              selectedItemColor: Colors.black,
                              unselectedItemColor: mycolors.rockblue,
                              items: [
                                BottomNavigationBarItem(
                                    icon: Icon(Icons.home),
                                    label: "Home",
                                    backgroundColor: mycolors.calypso),
                                BottomNavigationBarItem(
                                    icon: Icon(Icons.alarm),
                                    label: "Alarm",
                                    backgroundColor: mycolors.calypso),
                                BottomNavigationBarItem(
                                    icon: Icon(Icons.table_chart),
                                    label: "Stats",
                                    backgroundColor: mycolors.calypso),
                                BottomNavigationBarItem(
                                    icon: Icon(Icons.favorite),
                                    label: "Home",
                                    backgroundColor: mycolors.calypso),
                              ],
                            )))),
                _logocontainer(),
              ]),
            )));
  }
}
