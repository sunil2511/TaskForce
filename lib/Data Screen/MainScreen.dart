import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ErrorScreen.dart';
import 'HomeScreen.dart';

class MainScreen extends StatefulWidget {
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  Random random = new Random(10);

  @override
  void initState() {
    //print("Number Is:" + random.nextInt(10).toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataChnages(),
      ),
    );
  }

  DataChnages() {
    if (random.nextInt(10) == 0 &&
        random.nextInt(10) == 1 &&
        random.nextInt(10) == 2 &&
        random.nextInt(10) == 3) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ErrorScreen()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
