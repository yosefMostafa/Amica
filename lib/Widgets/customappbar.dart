import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget {
  final child, color1, color2;
  const Customappbar({this.child, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 12,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [this.color1, this.color2])),
      child: this.child == null ? Container() : this.child,
    );
  }
}
