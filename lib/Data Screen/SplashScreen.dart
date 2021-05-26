import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    NavigateMainScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/wallpaers.jpg',
          ),
          fit: BoxFit.cover,
        )),
      ),
    );
  }

  Future<void> NavigateMainScreen()  {
   Timer(Duration(seconds: 3),()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen())));
  }
}
