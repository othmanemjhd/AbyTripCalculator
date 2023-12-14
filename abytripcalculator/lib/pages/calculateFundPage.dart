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
    'assets/images/car3.png',

  ];
  List<Map<String,dynamic>> map = [];
  void calculateFundsAndSetResult() {
    // Appel de la fonction avec la valeur actuelle de inputValue
    setState(() {
      CalculateFund instance = CalculateFund();
      Result currentResult = instance.calculate(_selectedNumber);
      _priceToRefund = currentResult.result;
      resultDecomposition = currentResult.resultDecomposition;
      map = instance.generateResultMap();
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
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color here
        ),

      ),
      body: SingleChildScrollView(
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
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Saisir le nombre de kilomètre global',
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    border: OutlineInputBorder(),

                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0), // Ajustez cet espacement selon vos besoins
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
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.1,
                          MediaQuery.of(context).size.height * 0.015,
                          MediaQuery.of(context).size.width * 0.1,
                          MediaQuery.of(context).size.height * 0.015,
                        ),
                        backgroundColor: Colors.green[900],
                        shape : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    child: const Text('Calculer',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Ajoutez ici la logique pour le bouton "Annuler"
                      setState(() {
                        _priceToRefund = 0;
                        resultDecomposition = "";
                        _selectedNumberController.clear();
                        map.clear();
                      });
                    },
                    style : ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[200],
                        padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.1,
                          MediaQuery.of(context).size.height * 0.015,
                          MediaQuery.of(context).size.width * 0.1,
                          MediaQuery.of(context).size.height * 0.015,
                        ),
                        shape : RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    child: const Text('Annuler',style : TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    )),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Le montant à rembourser est : ${_priceToRefund.toStringAsFixed(2)} €',
                            style: const TextStyle(
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.bold,
                          ),),

                   /* Text("Décomposition du calcul : $resultDecomposition",
                      style: const TextStyle(
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.bold,
                      ),)*/
                  ],
                ),
              ),
            const SizedBox(height: 80.0),
         Padding(
           //padding: const EdgeInsets.all(8.0),
           padding: EdgeInsets.fromLTRB(
             MediaQuery.of(context).size.width * 0.25,
             MediaQuery.of(context).size.height * 0.015,
             MediaQuery.of(context).size.width * 0.25,
             MediaQuery.of(context).size.height * 0.015,
           ),
           child: ElevatedButton(
               onPressed: () {
                 Navigator.pushNamed(context, '/display', arguments: map);
                 /*showDialog(
                   context: context,
                   builder: (BuildContext context) {
                     return  MyDialog( map: map);
                   },
                 );*/
               },
               child: const Text("Décomposition",
                   style: TextStyle(
                       fontFamily: 'montserrat',
                       fontWeight: FontWeight.bold))),
         ),
          ],
        ),

      ),

    );

  }
}