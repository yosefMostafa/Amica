import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Screens/Sign/Signin.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:amica/Screens/Profile/Mainprofilescreen.dart';
import 'package:provider/provider.dart';

class Drawerwidget extends StatefulWidget {
  const Drawerwidget({Key? key}) : super(key: key);

  @override
  _DrawerwidgetState createState() => _DrawerwidgetState();
}

class _DrawerwidgetState extends State<Drawerwidget> {
  final mycolors = Mycolors();
  TextEditingController _searchcontroller = TextEditingController();

  _buildlisttile(
      Icon icon, String title, VoidCallback tabhandeler, double margin) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: margin),
      //width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mycolors.calypso.withOpacity(0.5),
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.only(left: padding),
        onTap: tabhandeler,
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  _buildlisttileFa(
      FaIcon icon, String title, Function tabhandeler, double margin) {
    return Container(
      margin: EdgeInsets.only(top: 5, left: margin),
      //width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: mycolors.calypso.withOpacity(0.5),
      ),
      child: ListTile(
        // contentPadding: EdgeInsets.only(left: padding),
        onTap: () => tabhandeler,
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: Colors.black45, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  _navigatetoprofile(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Mainprofilescreen();
    }));
  }

  _header(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [mycolors.calypso.withOpacity(0.9), mycolors.tangora])),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Color.fromARGB(255, 47, 46, 46)],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () => {},
                )),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                      hintText: "Search"),
                  controller: _searchcontroller,
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [mycolors.calypso, mycolors.rockblue],
        )),
        child: Column(
          children: [
            _header(context),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildlisttile(Icon(Icons.person), "PROFILE",
                          () => _navigatetoprofile(context), 0),
                      _buildlisttile(
                          Icon(Icons.settings), "SETTINGS", () {}, 0),
                      _buildlisttile(Icon(Icons.notifications), "NOTIFICATIONS",
                          () {}, 80),
                      _buildlisttile(
                          Icon(Icons.delete_forever), "RESETMYDATA", () {}, 80),
                      _buildlisttile(
                          Icon(Icons.share_sharp), "SHARE", () {}, 0),
                      _buildlisttile(
                          Icon(Icons.brightness_1), "CHANGE THEME", () {}, 0),
                      _buildlisttile(Icon(Icons.message), "FAQ", () {}, 0),
                      _buildlisttileFa(
                          FaIcon(
                            FontAwesomeIcons.whatsapp,
                            size: 24,
                          ),
                          "WHAT'S UP",
                          () {},
                          0),
                      _buildlisttile(Icon(Icons.phone), "CONTACT US", () {}, 0),
                      _buildlisttile(Icon(Icons.exit_to_app), "Sign out", () {
                        Provider.of<Auth>(context, listen: false).logout();
                      }, 0),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
