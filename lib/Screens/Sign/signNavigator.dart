import 'package:amica/Screens/MainNavigation.dart';
import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Screens/Sign/Signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignNavigator extends StatelessWidget {
  const SignNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider.of<Auth>(context).isAuth ? Mainnavigation() : Signin(),
    );
  }
}
