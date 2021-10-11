import 'dart:async';

import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Emailvalid extends StatefulWidget {
  const Emailvalid({Key? key}) : super(key: key);

  @override
  _EmailvalidState createState() => _EmailvalidState();
}

class _EmailvalidState extends State<Emailvalid> {
  final mycolors = Mycolors();
  late Timer timer;
  String text = "Wating for email verification";
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  checkemail(BuildContext context) async {
    bool verfied = await Provider.of<Auth>(context, listen: false)
        .confirmverfication(
            Provider.of<Auth>(context, listen: false).temptoken);
    if (verfied) {
      timer.cancel();
      setState(() {
        text = "Email verfied";
      });
      Fluttertoast.showToast(
          msg: "Email verified Sign in now",
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white);
    }
  }

  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      checkemail(context);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mycolors.calypso,
        title: Center(
          child: Text("Verification"),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [mycolors.geyser, mycolors.calypso],
          stops: [0.1, 1],
        )),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
