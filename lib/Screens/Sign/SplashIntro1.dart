import 'package:amica/Screens/Sign/SplashIntro2.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashIntro1 extends StatefulWidget {
  SplashIntro1();
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _SplashIntro1 createState() => _SplashIntro1();
}

class _SplashIntro1 extends State<SplashIntro1> {
  final name = GetStorage();
  final tstyle = TextStyle(
    fontSize: 30,
    color: Color.fromARGB(255, 54, 99, 146),
    fontWeight: FontWeight.w300,
  );
  var namecontroller = TextEditingController();
  _navigate(BuildContext ctx) {
    if (namecontroller.text != '') {
      name.write('name', namecontroller.text);
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
        return SplashIntro2();
      }));
    } else {
      alert();
    }
  }

  alert() {
    return (showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Error'),
        content: Text('Please Enter your name'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        body: Container(
      color: Color.fromARGB(125, 212, 221, 229), //background color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 60),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HEY !", style: tstyle),
                    Text("Tell us your name", style: tstyle)
                  ])),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                    hintText: "Enter your name ",
                    fillColor: Color.fromARGB(255, 249, 234, 231),
                    filled: true,
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.circular(10.0))),
              )),
          Container(
            child: CustomPaint(
              painter: OpenPainter(
                  MediaQuery.of(context).size.width / 3,
                  MediaQuery.of(context).size.height / 8,
                  20.0,
                  Color.fromARGB(255, 54, 99, 146),
                  PaintingStyle.fill),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: OpenPainter(
                  (MediaQuery.of(context).size.width / 3) + 7,
                  (MediaQuery.of(context).size.height / 8) + 3,
                  18.0,
                  Colors.black,
                  PaintingStyle.stroke),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: OpenPainter(
                  (MediaQuery.of(context).size.width / 3) * 2.3,
                  MediaQuery.of(context).size.height / 8,
                  80.0,
                  Color.fromARGB(255, 54, 99, 146),
                  PaintingStyle.fill),
            ),
          ),
          Container(
            child: CustomPaint(
              painter: OpenPainter(
                  ((MediaQuery.of(context).size.width / 3) * 2.3) + 30,
                  MediaQuery.of(context).size.height / 8,
                  80.0,
                  Colors.black,
                  PaintingStyle.stroke),
            ),
          ),
          Container(
            child: CustomPaint(
                painter: OpenPainter(
                    ((MediaQuery.of(context).size.width / 3) * 2.3) + 20,
                    MediaQuery.of(context).size.height / 8,
                    20.0,
                    Color.fromARGB(255, 212, 221, 229),
                    PaintingStyle.fill),
                child: Container(
                    padding: EdgeInsets.only(
                        left: ((MediaQuery.of(context).size.width / 3) * 2.3) +
                            10,
                        top: (MediaQuery.of(context).size.height / 8) - 10),
                    child: InkWell(
                        onTap: () => _navigate(context),
                        child: Icon(Icons.arrow_forward)))),
          )
          // Container(
          //     padding: EdgeInsets.only(
          //         left: ((MediaQuery.of(context).size.width / 3) * 2.3) + 10,
          //         top: (MediaQuery.of(context).size.height / 8) - 10),
          //     child: RawMaterialButton(
          //       onPressed: () {},
          //       elevation: 0,
          //       fillColor: Colors.white,
          //       child: Icon(
          //         Icons.pause,
          //         size: 35.0,
          //       ),
          //       shape: CircleBorder(),
          //     ))
        ],
      ),
    )));
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
