import 'dart:async';
import 'package:flutter/material.dart';
import 'package:abytripcalculator/pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulez un chargement en utilisant un délai
    Timer(const Duration(seconds: 3), () {
      // Après le chargement, passez à la page d'accueil
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/home3.png', // Remplacez par le chemin correct
              fit: BoxFit.cover,
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),]
      ),
    );
  }
}