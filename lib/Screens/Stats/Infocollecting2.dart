import 'dart:ui';

import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Infocollecting2 extends StatefulWidget {
  const Infocollecting2({Key? key}) : super(key: key);

  @override
  _Infocollecting2State createState() => _Infocollecting2State();
}

class _Infocollecting2State extends State<Infocollecting2> {
  final mycolors = Mycolors();

  _backbutton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin:
          EdgeInsets.only(left: 5, top: MediaQuery.of(context).padding.top + 5),
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
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 20,
          )),
    );
  }

  _bkg() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [mycolors.calypso, mycolors.rockblue])),
    );
  }

  _drawthecircle(String title, String image, Function ontaphandler) {
    return Column(
      children: [
        InkWell(
          onTap: () => ontaphandler,
          child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill))),
        ),
        Container(
            child: FittedBox(
          fit: BoxFit.contain,
          child: Text(title),
        )),
      ],
    );
  }

  _page(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 12,
            child: InkWell(
              onTap: () {
                final nav = Navigator.of(context);
                nav.pop();
                nav.pop();
              },
              child: Text(
                "Done",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 12 * 5,
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "WHERE WERE YOU ?",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Expanded(
                    child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          _drawthecircle("HOME",
                              'assets/images/statsicons/Home.png', () {}),
                          _drawthecircle("WORK",
                              'assets/images/statsicons/work1.png', () {}),
                          _drawthecircle("PLACE OF STUDY",
                              'assets/images/statsicons/grad_hat.png', () {}),
                          _drawthecircle("TRANSPORT",
                              'assets/images/statsicons/sedan.png', () {}),
                          _drawthecircle("GYM",
                              'assets/images/statsicons/dumbell.png', () {}),
                          _drawthecircle("OUTDOORS",
                              'assets/images/statsicons/bicycle.png', () {}),
                          _drawthecircle("RESTAURANT",
                              'assets/images/statsicons/tray.png', () {}),
                          _drawthecircle("ADD NEW",
                              'assets/images/statsicons/add.png', () {}),
                        ],
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent:
                              MediaQuery.of(context).size.height / 12 * 2,
                          crossAxisCount: 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        )))
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 12 * 4,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      width: 2,
                      color: mycolors.rockblue,
                    )),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  expands: true,
                  scrollPadding: EdgeInsets.all(20),
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  maxLength: 5000,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(),
                      hintMaxLines: 2,
                      hintText:
                          "Would you like to elaborate on what happened ?"),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 12 * 4 - 40,
                      left: 30,
                      right: 30),
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: mycolors.geyser))),
                  child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Add a note",
                        style: TextStyle(),
                      )))
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.amber,
        body: Stack(
      children: [
        _bkg(),
        _page(context),
        _backbutton(context),
      ],
    ));
  }
}
