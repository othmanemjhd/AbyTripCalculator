import 'package:abytripcalculator/pages/calculateFundPage.dart';
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
        '/' : (context) => const SplashScreen(),// Démarre avec l'écran de chargement
      '/home' : (context) => const HomePage(),
        '/login' : (context) => const LoginPage(),
        '/count' : (context) =>const CalculateFundPage(),
    },

    );
  }
}



