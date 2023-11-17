import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleAuthService {

  Future<bool> authenticate(String enteredUsername, String enteredPassword) async {
    // Replace 'your_username' and 'your_password' with your desired username and password
    String validUsername = 'test';
    String validPassword = 'test';

    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      // Authentication successful
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('authenticated', true);

      return true;
    } else {
      // Authentication failed
      return false;
    }
  }

}
