import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Screens/Sign/emailvalidation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:amica/Widgets/colors.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  final name;
  Signup(this.name);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Signup createState() => _Signup();
}

class _Signup extends State<Signup> {
  var datepicker = "Enter your birthay";
  final mycolors = Mycolors();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool showtext = true;
  late DateTime date;
  setshowtext() {
    setState(() {
      showtext = !showtext;
    });
  }

  String dropdownValue = 'Male';

  _dropdown(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 0,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  _showdate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.utc(2010, 1, 1),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      } else {
        setState(() {
          this.date = value;
          this.datepicker = date.year.toString() +
              "/" +
              date.month.toString() +
              "/" +
              date.day.toString();
        });
        print(datepicker);
      }
    });
  }

  _signupchecker(BuildContext context) {
    int flag = 0;
    Provider.of<Auth>(context, listen: false)
        .Sign_up(emailcontroller.text, passwordcontroller.text)
        .catchError((e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white);
      flag = 1;
    }).then((value) => {
              if (flag == 0)
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return Emailvalid();
                  }))
                }
            });

    // .then((value) => Provider.of<Auth>(context, listen: false)
    //     .Verify(emailcontroller.text, passwordcontroller.text));
  }

  _bkg(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [mycolors.geyser, mycolors.calypso],
            stops: [0.1, 1],
          )),
        ),
        Opacity(
            opacity: 0.1,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo5.png'),
                      fit: BoxFit.fill)),
            )),
      ],
    );
  }

  _body(BuildContext contex) {
    return Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                "Welcome " + widget.name,
                style: TextStyle(
                    fontSize: 35,
                    color: mycolors.calypso,
                    fontWeight: FontWeight.w300),
              )),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [mycolors.fadeyellow, mycolors.geyser],
                  )),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Enter your email ",

                    // fillColor:
                    // // Color.fromARGB(255, 249, 234, 231),
                    // filled: true,
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.circular(10.0))),
              )),
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [mycolors.fadeyellow, mycolors.geyser],
                  )),
              child: TextField(
                obscureText: showtext,
                keyboardType: TextInputType.emailAddress,
                controller: passwordcontroller,
                decoration: InputDecoration(
                    hintText: "Enter your password ",
                    suffixIcon: IconButton(
                      icon: Icon(
                          showtext ? Icons.visibility : Icons.visibility_off),
                      onPressed: () => setshowtext(),
                    ),
                    // fillColor:
                    // // Color.fromARGB(255, 249, 234, 231),
                    // filled: true,
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 4),
                        borderRadius: BorderRadius.circular(10.0))),
              )),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 30, right: 30, top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [mycolors.fadeyellow, mycolors.geyser],
                )),
            child: MaterialButton(
                onPressed: () => _showdate(),
                child: Text(
                  datepicker,
                  style: TextStyle(fontWeight: FontWeight.w400),
                )),
            // child: TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   controller: emailcontroller,
            //   decoration: InputDecoration(
            //       hintText: "Enter your Birthday ",

            //       // fillColor:
            //       // // Color.fromARGB(255, 249, 234, 231),
            //       // filled: true,
            //       contentPadding: EdgeInsets.all(20),
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide(width: 4),
            //           borderRadius: BorderRadius.circular(10.0))),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            margin: EdgeInsets.only(left: 30, right: 30, top: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [mycolors.fadeyellow, mycolors.geyser],
                )),
            child: _dropdown(context),
            // child: TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   controller: emailcontroller,
            //   decoration: InputDecoration(
            //       hintText: "Enter your Gender ",

            //       // fillColor:
            //       // // Color.fromARGB(255, 249, 234, 231),
            //       // filled: true,
            //       contentPadding: EdgeInsets.all(20),
            //       border: OutlineInputBorder(
            //           borderSide: BorderSide(width: 4),
            //           borderRadius: BorderRadius.circular(10.0))),
          ),
          InkWell(
              onTap: () => _signupchecker(context),
              child: Container(
                alignment: Alignment.center,
                height: 80,
                width: 80,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  color: mycolors.tangora,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 20, color: mycolors.geyser),
                ),
              ))
        ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mycolors.calypso,
          title: Center(
              child: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 20,
              color: mycolors.geyser,
            ),
          )),
        ),
        body: Stack(children: [
          _bkg(context),
          _body(context),
        ]));
  }
}
