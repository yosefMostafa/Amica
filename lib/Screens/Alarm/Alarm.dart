import 'package:amica/Widgets/Alarmbackground.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  final mycolors = Mycolors();
  List alarmlist = [];
  TimeOfDay time = TimeOfDay(hour: 00, minute: 00);

  _addAlarm(BuildContext ctx) {
    showTimePicker(
      context: ctx,
      initialTime: TimeOfDay(hour: 00, minute: 00),
    ).then((value) {
      if (value == null)
        return false;
      else {
        setState(() {
          this.time = value;
        });
        print(time);
        return true;
      }
    }).then((value) {
      if (value == false) return value;
      TextEditingController namec = TextEditingController();
      showDialog<String>(
        context: ctx,
        builder: (BuildContext ctx) => AlertDialog(
          title: const Text('Name your alarm'),
          content: TextField(
            controller: namec,
            decoration: InputDecoration(
              hintText: "Enter alarm name",
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  alarmlist.add({
                    "hour": this.time.hour,
                    "min": this.time.minute,
                    "name": namec.text,
                  });
                });

                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  _checkvisable(BuildContext ctx) {
    if (alarmlist.isEmpty == false) {
      return Theme(
          data: Theme.of(context).copyWith(
            primaryColor: mycolors.tangora,
          ),
          child: Container(
              margin: EdgeInsets.only(bottom: 50),
              child: FloatingActionButton(
                backgroundColor: mycolors.tangora,
                onPressed: () => _addAlarm(ctx),
                tooltip: 'Increment',
                child: Icon(
                  Icons.add,
                ),
              )));
    }
  }

  _checklist(BuildContext ctx) {
    if (alarmlist.isEmpty) {
      return Container(
        alignment: Alignment.center,
        height: 80,
        width: 80,
        margin: EdgeInsets.only(
            top: MediaQuery.of(ctx).size.height / 3 * 2 - 40,
            left: MediaQuery.of(ctx).size.width / 2 - 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: mycolors.tangora,
        ),
        child: InkWell(
          onTap: () => _addAlarm(ctx),
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return _alarmdrawer(ctx);
    }
  }

  _alarmdrawer(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(ctx).size.height / 2),
      color: Colors.transparent,
      child: ListView.builder(
        itemBuilder: (ctx, i) => _alrmbuilder(ctx, i),
        itemCount: alarmlist.length,
      ),
    );
  }

  _deletealarm(int i) {
    setState(() {
      alarmlist.removeAt(i);
    });
  }

  _alrmbuilder(ctx, i) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      height: 75,
      color: Colors.transparent,
      child: Card(
        color: mycolors.tangora.withOpacity(0.5),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border:
                Border(left: BorderSide(color: mycolors.rockblue, width: 2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                alarmlist[i]["name"],
                style: TextStyle(fontSize: 20, color: mycolors.rockblue),
              ),
              Text(
                "${alarmlist[i]["hour"]}:${alarmlist[i]["min"]}",
                style: TextStyle(fontSize: 20, color: mycolors.rockblue),
              ),
              InkWell(
                  onTap: () => _deletealarm(i),
                  child: Icon(
                    Icons.delete,
                    color: mycolors.rockblue,
                    size: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _moon(BuildContext context) {
    return Opacity(
        opacity: 0.8,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(
              50, MediaQuery.of(context).size.height / 3 - 100, 0, 0),
          height: MediaQuery.of(context).size.height / 3 + 50,
          width: MediaQuery.of(context).size.width - 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/moon.png'),
                  fit: BoxFit.fill)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Alarmbackground(), //number 1 for alarm screen flag
          _moon(context),
          _checklist(context),
        ],
      ),
      floatingActionButton: _checkvisable(context),
    );
  }
}
