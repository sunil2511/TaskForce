import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/Data%20Screen/dataApi.dart';


class ErrorScreen extends StatefulWidget {
  ErrorScreenState createState() => ErrorScreenState();
}

class ErrorScreenState extends State<ErrorScreen> {
  Random random = new Random(10);

  @override
  void initState() {
    GetErrorData();
        super.initState();
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            child: Text("Error"),
          ),
        );
      }
    
      void GetErrorData() {
        getError().then((value){
            if(value!=null){
              print(value);
            }
            else{
              return 1;
            }
        });
      }
}
