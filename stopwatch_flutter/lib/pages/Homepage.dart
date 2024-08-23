import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  @override
 _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning){
      stopwatch.stop();
    }
    else{
      stopwatch.start();
    }
  }

  String returnFormatedText() {
    var milli = stopwatch.elapsed.inMilliseconds; 

    String milliseconds = (milli % 1000).toString().padLeft(3,"0"); 
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2,"0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2,"0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch=Stopwatch();

    t = Timer.periodic(Duration(milliseconds: 30), (timer){
      setState(() {});
        
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            onPressed: (){
              handleStartStop();
              },
            padding: EdgeInsets.all(0),
            child: Container(
              height: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xff0395ab),
                  width: 4,
                ),
              ),
              child:Text(returnFormatedText(),style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),) ,
            ),
          ),

        SizedBox(height: 15,),
          
          CupertinoButton(
            onPressed: (){
              stopwatch.reset();
              },
            padding: EdgeInsets.all(0),
            child: Text('Reset',style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold 
            ),),
          )
        ],
       ), 
      )),
    );
  }
}
