import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aby Trip Calculator', style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
        centerTitle: true,
        backgroundColor:Colors.orange[400],
        elevation: 0,
      ),
      body:  Center(
        child  : Image.asset('assets/images/home3.png',
            width: double.infinity,
            fit: BoxFit.cover),
      ),

      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        backgroundColor: Colors.green[800],
        label: const Text('SE CONNECTER',
          style:TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold),),
        icon: const Icon(Icons.car_repair_outlined),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}