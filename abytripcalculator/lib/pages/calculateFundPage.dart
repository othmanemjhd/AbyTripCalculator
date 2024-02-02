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
  double _selectedNumber = 0;
  double _priceToRefund = 0;
  late String resultDecomposition = "";
  String _toRefund_text ='Le montant à rembourser est :';

  final TextEditingController _selectedNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _imageUrls = [
    'assets/images/car1.png',
    'assets/images/car2.png',
    'assets/images/car3.png',

  ];
  List<Map<String,dynamic>> map = [];
  FocusNode _focusNode = FocusNode();

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
  void dispose() {
    // Dispose of the FocusNode when the widget is disposed
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;

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
        child: GestureDetector(
          onTap: () {
            // Call the unfocus method to hide the keyboard
            _focusNode.unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Center(
                  child: Text('Bienvenue ABYLSEN. ',style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'poppins'
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
                    focusNode: _focusNode,
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
                        _selectedNumber = double.tryParse(value) ?? 0;
                         (_selectedNumber > 150)?_toRefund_text = 'PIGD : Politique Indeminité Grand Déplacement.':
                          _toRefund_text = 'Le montant à rembourser est :';

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
                        if (_formKey.currentState!.validate() && _selectedNumber <=150) {
                          // Ajoutez ici la logique pour le bouton "Calculer"
                          calculateFundsAndSetResult();
                        }
                        _focusNode.unfocus();

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
                          _toRefund_text = 'Le montant à rembourser est :';
                          _selectedNumber=0;
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
                      Text((_selectedNumber)<=150?'$_toRefund_text ${_priceToRefund.toStringAsFixed(2)} €':_toRefund_text,
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
             // child: _selectedNumber < 150? ElevatedButton(
             //     onPressed: () {
             //       Navigator.pushNamed(context, '/display', arguments: map);
             //       /*showDialog(
             //         context: context,
             //         builder: (BuildContext context) {
             //           return  MyDialog( map: map);
             //         },
             //       );*/
             //     },
             //     child: const Text("Décomposition",
             //         style: TextStyle(
             //             fontFamily: 'montserrat',
             //             fontWeight: FontWeight.bold))
             // ):null,

           ),

            ],

          ),

        ),

      ),
    floatingActionButton:  (_selectedNumber > 150 || keyboardIsOpened )? null :FloatingActionButton.extended(
      onPressed: (){
        Navigator.pushNamed(context, '/display', arguments: map);
      },
      label: Text('Décomposition',
          style: const TextStyle(
          fontFamily: 'montserrat',
          fontWeight: FontWeight.bold,
      )),
      icon: Icon(Icons.list_alt),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0)
      ),

    ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: _selectedNumber < 150? BottomAppBar(
      shape:const CircularNotchedRectangle(),
      height: 50,
    ):null,
    );

  }
}