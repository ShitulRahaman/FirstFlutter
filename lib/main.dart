import 'package:flutter/material.dart';
import 'package:myfluttertest/Pages/LoginPage.dart';
import 'package:myfluttertest/Pages/MainPage.dart';
import 'package:myfluttertest/Pages/MovieDetailsPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/main':(context) => MainPage(),
        '/details':(context)=>MovieDetailsPage(),
      }
    );
  }
}

