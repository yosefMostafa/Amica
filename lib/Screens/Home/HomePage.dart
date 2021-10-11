import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mycolors = Mycolors();
  _bkg(BuildContext context) {
    return Column(
      children: [
        Container(
          // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bkg.gif'),
                  fit: BoxFit.fill)),
        ),
        // Container(
        //     width: double.infinity,
        //     height: MediaQuery.of(context).size.height / 3,
        //     decoration: BoxDecoration(color: Color.fromRGBO(74, 74, 74, 1)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        body: Stack(
      children: [
        _bkg(context),
      ],
    ));
  }
}
