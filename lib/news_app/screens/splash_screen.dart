import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/news_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget{
    @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 @override
   
   @override
   void initState() {
     super.initState();
     
     Timer(Duration(seconds: 5), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  
     });
   }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All In One', style: const TextStyle(color: Colors.white, fontSize: 35 ),),
              Text('News', style: const TextStyle(color: Colors.red, fontSize: 70 ),),
            ],
          )
          ),
      ),
    );
  }
}