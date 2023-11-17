import 'package:abytripcalculator/pages/countFundPage.dart';
import 'package:abytripcalculator/pages/home.dart';
import 'package:abytripcalculator/pages/loading.dart';
import 'package:abytripcalculator/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: SplashScreen(),
      routes: {
        '/' : (context) => SplashScreen(),// Démarre avec l'écran de chargement
      '/home' : (context) => HomePage(),
        '/login' : (context) => LoginPage(),
        '/count' : (context) =>CountFundPage(),
    },

    );
  }
}




