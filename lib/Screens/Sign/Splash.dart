import 'package:amica/Screens/Sign/SplashIntro1.dart';
import 'package:amica/Screens/Sign/signNavigator.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  final seen;
  Splash(final this.seen);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  // final introdate = GetStorage();
  _goTo(BuildContext ctx) {
    if (widget.seen)
      return SignNavigator();
    else {
      // introdate.write('seen', true);
      return SplashIntro1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        decoration: BoxDecoration(
            //backgroundcolors
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 54, 99, 146),
              Color.fromARGB(255, 212, 221, 229)
            ])),
        child: AnimatedSplashScreen(
          backgroundColor: Colors.transparent,
          splash: Container(
              child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, //controls the png to center
                  children: [
                Image.asset(
                  'assets/images/logo5.png',
                ),
                // Image.asset('assets/images/logo5.png'),
                Text(
                  "We Belive In you",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
                )
              ])),
          duration: 1500,
          splashIconSize: double.infinity,
          nextScreen: _goTo(context),
          splashTransition: SplashTransition.fadeTransition,
        )));
  }
}
