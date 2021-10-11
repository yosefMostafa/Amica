import 'package:amica/Widgets/Statsbackground.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

import 'Calendar.dart';
import 'Infocollecting.dart';

class Statsmainscreen extends StatefulWidget {
  const Statsmainscreen({Key? key}) : super(key: key);

  @override
  _StatsmainscreenState createState() => _StatsmainscreenState();
}

class _StatsmainscreenState extends State<Statsmainscreen> {
  final mycolors = Mycolors();
  late DateTime lastopened;
  bool Switch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastopened = DateTime.utc(2021, 10, 5, 10); //get from db last opened date
    _getPage();
    WidgetsBinding.instance
        ?.addPostFrameCallback((_) => navigatetocollect(context));
  }

  navigatetocollect(BuildContext context) {
    if (this.Switch == true) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return Infocollecting();
      }));
    }
  }

  _getPage() {
    DateTime nowtime = DateTime.now();
    print(nowtime);
    print(lastopened);
    print(nowtime.difference(lastopened).inHours);
    if (nowtime.difference(lastopened).inHours >= 24) {
      setState(() {
        lastopened = nowtime;
        Switch = true;
      });
    }
  }

  _stats(BuildContext ctx) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top +
                MediaQuery.of(context).size.height / 12),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 2,
                    color: mycolors.calypso,
                  )),
              height: MediaQuery.of(context).size.height / 12 - 20,
              child: TabBar(
                indicator: BoxDecoration(
                    color: mycolors.rockblue,
                    borderRadius: BorderRadius.circular(10)),
                unselectedLabelColor: Colors.black.withOpacity(0.5),
                labelColor: Colors.black.withOpacity(0.5),
                tabs: [
                  FittedBox(fit: BoxFit.contain, child: Text("LAST 90 DAYS")),
                  FittedBox(fit: BoxFit.contain, child: Text("LAST WEEK")),
                  FittedBox(fit: BoxFit.contain, child: Text("THIS WEEK")),
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.yellow,
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(),
                Calendar(),
                Calendar(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Statsbackground(),
          _stats(context),
        ],
      ),
    );
  }
}
