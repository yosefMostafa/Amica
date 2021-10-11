import 'package:amica/Screens/Sign/Signin.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashIntro2 extends StatefulWidget {
  SplashIntro2();
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SplashIntro2 createState() => _SplashIntro2();
}

class _SplashIntro2 extends State<SplashIntro2> {
  final introdate = GetStorage();
  _navigate(BuildContext ctx) {
    introdate.write('seen', true);
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      return Signin();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(125, 212, 221, 229), //background color
      child: CustomPaint(
        painter: OpenPainter(
            (MediaQuery.of(context).size.width / 3) * 2.3,
            (MediaQuery.of(context).size.height / 4) * 3,
            80.0,
            Color.fromARGB(255, 54, 99, 146),
            PaintingStyle.fill),
        child: Container(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 3) * 2.3 - 50,
                top: (MediaQuery.of(context).size.height / 4) * 3 - 20),
            child: InkWell(
              onTap: () => _navigate(context),
              child: Text(
                "Agree",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
            )),
      ),
    ));
  }
}

class OpenPainter extends CustomPainter {
  final width, height, raduis, color, style;
  OpenPainter(this.width, this.height, this.raduis, this.color, this.style);
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = color
      ..style = style;
    canvas.drawCircle(Offset(width, height), raduis, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
