import 'package:abytripcalculator/services/SingleAuthService.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {


  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool isLoading = false;
 SingleAuthService singleAuthService = SingleAuthService();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text(
          'Aby Trip Calculator',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[400],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const Text('SE CONNECTER',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
                const SizedBox(height: 80),
                const Text('ATC',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        fontFamily: 'Lalezar')),
                const Text('AbyTripCalculator',
                    style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 5.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat')),
                //Image.asset('assets/images/logo.png'),
                const SizedBox(height: 100),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: 'Identifiant',
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                     // contentPadding: EdgeInsets.symmetric(vertical: 30),
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value?.isEmpty == true ) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },

                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),

                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value?.isEmpty == true ) {
                      return 'Ce champ est obligatoire';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    final currentContext = context;

                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Exemple de validation simple
                    if (formKey.currentState!.validate()) {
                    // Le formulaire est valide, vous pouvez traiter les données ici
                    authenticate(currentContext,username,password);
                    }
                  },
                  style : ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[900],
                    padding:const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    shape : RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                  child: const Text('SE CONNECTER',style: TextStyle(
                    fontFamily:'Montserrat',
                    fontWeight: FontWeight.bold,
                    color:Colors.white,
                  ))
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }




  void authenticate(context,username,password) async {
   /* String enteredUsername = _usernameController.text;
    String enteredPassword = _passwordController.text;*/

    bool isAuthenticated = await singleAuthService.authenticate(username, password);

    if (isAuthenticated) {
      // Navigate to the next screen or perform other actions after successful authentication
      Navigator.pushNamed(context, '/count');
    } else {
      // Authentication failed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Authentication échouée'),
            content: const Text('Identifiant ou mot de passe invalide'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
