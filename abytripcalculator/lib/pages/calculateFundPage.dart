import 'package:abytripcalculator/services/CountFundsService.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../services/CalculateFundsByTrancheService.dart';
import '../tools/Result.dart';

class CalculateFundPage extends StatefulWidget {
  const CalculateFundPage({super.key});

  @override
  State<CalculateFundPage> createState() => _CalculateFundPageState();
}

class _CalculateFundPageState extends State<CalculateFundPage> {
  int _selectedNumber = 0;
  double _priceToRefund = 0;
  late String resultDecomposition = "";
  final TextEditingController _selectedNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _imageUrls = [
    'assets/images/car1.png',
    'assets/images/car2.png',

  ];
  void calculateFundsAndSetResult() {
    // Appel de la fonction avec la valeur actuelle de inputValue
    setState(() {
      Result currentResult = calculateFunds(_selectedNumber);
      _priceToRefund = currentResult.result;
      resultDecomposition = currentResult.resultDecomposition;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Aby Trip Calculator',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Text('BIENVENUE',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Montserrat'
                  ),),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                ),
                items: _imageUrls.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(
                          url,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0), // Ajustez cet espacement selon vos besoins
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _selectedNumberController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty == true ) {
                        return 'Ce champ est obligatoire';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _selectedNumber = int.tryParse(value) ?? 0;
                      });
                    },

                    decoration: const InputDecoration(
                      labelText: 'Saisir le nombre de kilomètre global',
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0), // Ajustez cet espacement selon vos besoins
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Ajoutez ici la logique pour le bouton "Calculer"
                          calculateFundsAndSetResult();
                        }
                      },
                      style : ElevatedButton.styleFrom(
                          primary: Colors.green[900],
                          padding:const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape : RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      child: const Text('Calculer',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Ajoutez ici la logique pour le bouton "Annuler"
                        setState(() {
                          _priceToRefund = 0;
                          resultDecomposition = "";
                          _selectedNumberController.clear();
                        });
                        print('Annuler');
                      },
                      style : ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[200],
                          padding:const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape : RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)
                          )
                      ),
                      child: const Text('Annuler',style : TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                      )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Le montant à rembourser est : $_priceToRefund €',
                              style: const TextStyle(
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.bold,
                            ),),
                      const SizedBox(height: 20.0),
                      Text("Décomposition du calcul : $resultDecomposition .",
                          style : const TextStyle(
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.bold,
                          ))
                    ],


                  ),
                ),


              // Ajustez cet espacement selon vos besoins
            ],

          ),
        ),
      ),
    );
  }
}
