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
          //fontSize: 30,
          color: Colors.white,
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
        child: Container(height: 30.0,),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
        //extendedPadding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        backgroundColor: Colors.green[800],
        elevation: 20.0, // Set elevation (shadow)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          // Set border radius
         // side: const BorderSide(color: Colors.white, width: 2.0), // Set border color and width
        ),
        label: const Text('GET STARTED',
          style:TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color : Colors.white,
          ),

        ),
        icon: const Icon(Icons.car_repair_outlined,color: Colors.white,),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
