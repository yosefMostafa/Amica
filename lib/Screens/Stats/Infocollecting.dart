import 'package:amica/Screens/Stats/Infocollecting2.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Infocollecting extends StatefulWidget {
  const Infocollecting({Key? key}) : super(key: key);

  @override
  _InfocollectingState createState() => _InfocollectingState();
}

class _InfocollectingState extends State<Infocollecting> {
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
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 12,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return Infocollecting2();
              }));
            },
            child: Text(
              "Next",
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
                    "WHAT WERE YOU DOING ?",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Expanded(
                  child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _drawthecircle("WORKING",
                            'assets/images/statsicons/working.png', () {}),
                        _drawthecircle("RELAX",
                            'assets/images/statsicons/exercise.png', () {}),
                        _drawthecircle("STUDYING",
                            'assets/images/statsicons/book.png', () {}),
                        _drawthecircle("SOCIALIZING",
                            'assets/images/statsicons/social.png', () {}),
                        _drawthecircle("EXERCISING",
                            'assets/images/statsicons/exercise1.png', () {}),
                        _drawthecircle("HOUSEWORK",
                            'assets/images/statsicons/vaccum.png', () {}),
                        _drawthecircle("SOCIAL MEDIA",
                            'assets/images/statsicons/social1.png', () {}),
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
        Container(
          //alignment: Alignment.centerLeft,
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
                    "WHO WERE YOU WITH ?",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Expanded(
                  child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _drawthecircle("MY SELF",
                            'assets/images/statsicons/man.png', () {}),
                        _drawthecircle("CLOSE FRIENDS",
                            'assets/images/statsicons/family.png', () {}),
                        _drawthecircle("PARTENERS",
                            'assets/images/statsicons/couple.png', () {}),
                        _drawthecircle("COLLEAGUES",
                            'assets/images/statsicons/coworker.png', () {}),
                        _drawthecircle("FRIENDS",
                            'assets/images/statsicons/highfive.png', () {}),
                        _drawthecircle("PEOPLE IDK",
                            'assets/images/statsicons/crowed.png', () {}),
                        _drawthecircle("FAMILY",
                            'assets/images/statsicons/ballon.png', () {}),
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: Stack(
          children: [
            _bkg(),
            _backbutton(context),
            _page(context),
          ],
        ));
  }
}
