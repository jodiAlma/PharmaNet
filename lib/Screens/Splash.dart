import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pharma_net/Classes/Queries.dart';
import './Login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
    return Scaffold(
      body: Container(
        width: Queries.ScreenWidth(context),
        height: Queries.ScreenHeight(context),
        decoration: BoxDecoration(
            gradient: RadialGradient(
          radius: 0.75,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFC2D5FF),
            Color(0xFF4C88DE),
          ],
        )),
        child: Image.asset("images/logo.png"),
      ),
    );
  }
}
