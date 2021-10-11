import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Screens/Sign/Signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  Signin();
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _Signin createState() => _Signin();
}

class _Signin extends State<Signin> {
  final mycolors = Mycolors();
  final name = GetStorage();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  var _name = "";
  bool showtext = true;
  bool _isloading = false;
  setshowtext() {
    setState(() {
      showtext = !showtext;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadname();
  }

  _signinchecker(BuildContext ctx) {
    if (emailcontroller.text == '' || passwordcontroller.text == '') {
      Fluttertoast.showToast(
          msg: "Enter email and password",
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.black.withOpacity(0.5),
          textColor: Colors.white);
      return;
    }
    setState(() {
      _isloading = true;
    });

    Provider.of<Auth>(ctx, listen: false)
        .Sign_in(emailcontroller.text, passwordcontroller.text)
        .catchError((e) => Fluttertoast.showToast(
            msg: e.toString(),
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white))
        .then((value) => setState(() {
              _isloading = false;
            }));
  }

  _navigateSignup(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Signup(_name);
    }));
  }

  _loadname() {
    // name.write("seen", false);
    var temp = name.read('name');
    setState(() {
      _name = temp;
    });
  }

  _bkg() {
    return Container(
      // height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [mycolors.geyser, mycolors.calypso],
        stops: [0.1, 1],
      )),
      alignment: Alignment.center,
    );
  }

  _page(BuildContext context) {
    return SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width - 75,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/logo5.png'),
                fit: BoxFit.fill)),
      ),
      Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Welcome " + _name,
            style: TextStyle(
                fontSize: 35,
                color: mycolors.calypso,
                fontWeight: FontWeight.w300),
          )),
      Container(
          margin: EdgeInsets.all(30),
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
          margin: EdgeInsets.only(left: 30, right: 30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [mycolors.fadeyellow, mycolors.geyser],
              )),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: passwordcontroller,
            obscureText: showtext,
            decoration: InputDecoration(
                hintText: "Enter your password ",
                suffixIcon: IconButton(
                  icon:
                      Icon(showtext ? Icons.visibility : Icons.visibility_off),
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
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Text(
                "You don't have an account ?! ",
                style: TextStyle(fontSize: 15),
              ),
              InkWell(
                  onTap: () => _navigateSignup(context),
                  child: Text(
                    "Sign up now.",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: mycolors.calypso,
                    ),
                  ))
            ],
          )),
      InkWell(
          onTap: () => _signinchecker(context),
          child: Container(
            alignment: Alignment.center,
            height: 80,
            width: 80,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: mycolors.tangora,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Next",
              style: TextStyle(fontSize: 20, color: mycolors.geyser),
            ),
          ))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mycolors.calypso,
          title: Center(
              child: Text(
            "Sign in",
            style: TextStyle(fontSize: 20, color: mycolors.geyser),
          )),
        ),
        body: Stack(
          children: [
            _bkg(),
            _isloading
                ? Center(
                    child: CircularProgressIndicator(
                      color: mycolors.tangora,
                      backgroundColor: Colors.grey,
                    ),
                  )
                : _page(context)
          ],
        ));
  }
}
