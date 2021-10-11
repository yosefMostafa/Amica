import 'package:amica/Widgets/colors.dart';
import 'package:amica/Widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Statsbackground extends StatelessWidget {
  Statsbackground({Key? key}) : super(key: key);
  final mycolors = Mycolors();
  @override
  Widget build(BuildContext context) {
    _bkg(BuildContext context) {
      return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage('assets/images/statsbkg.png'),
                fit: BoxFit.fill)),
      );
    }

    _appbar(BuildContext context) {
      return Customappbar(
        color1: mycolors.tangora,
        color2: mycolors.rockblue,
        child: Center(
          child: Text(
            "STATISTICS",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(children: [
        _bkg(context),
        _appbar(context),
      ]),
    );
  }
}
