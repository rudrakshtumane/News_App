import 'package:flutter/material.dart';
import 'package:flutter_catalog/news_app/screens/splash_screen.dart';
import 'package:get/get.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

@override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
        appBar: AppBar(
          title: Text('hello', style: const TextStyle(color: Colors.white, fontSize: 28),),
        ),

        body: Container(
          child: Text('hello ')
        )
        


    );
  }
}
