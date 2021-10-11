import 'package:amica/Widgets/colors.dart';
import 'package:amica/Widgets/customappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Profilenavigation.dart';

class Mainprofilescreen extends StatefulWidget {
  const Mainprofilescreen({Key? key}) : super(key: key);

  @override
  _MainprofilescreenState createState() => _MainprofilescreenState();
}

class _MainprofilescreenState extends State<Mainprofilescreen> {
  final mycolors = Mycolors();

  _appbarbackbutton(BuildContext ctx) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 5),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.black, Color.fromARGB(255, 47, 46, 46)],
          )),
      child: IconButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          )),
    );
  }

  _appbartitle(BuildContext ctx) {
    return Customappbar(
        child: Stack(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: _appbarbackbutton(ctx),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Profile ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ]),
        color1: mycolors.tangora,
        color2: mycolors.calypso);
  }

  _photocontainer(ctx) {
    return Container(
      width: double.infinity,
      // height: MediaQuery.of(ctx).size.height / 6,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 80,
            width: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.fill)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "My name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
            Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.center,
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Colors.black, Color.fromARGB(255, 47, 46, 46)],
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 15,
                  ),
                )),
          ]),
        ],
      ),
    );
  }

  _body(context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 6,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                // stops: [0.1, 1],
                colors: [
              mycolors.calypso,
              mycolors.rockblue,
              Colors.white.withOpacity(1),
            ])),
        child: Column(
          children: [
            _photocontainer(context),
            Profilenavigation(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("hi");
        Navigator.pop(context, false);
        return false;
      },
      child: Scaffold(
        body: Container(
            child: Column(children: [
          _appbartitle(context),
          _body(context),
        ])),
      ),
    );
  }
}
