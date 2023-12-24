import 'package:shared_preferences/shared_preferences.dart';

class SingleAuthService {

  Future<bool> authenticate(String enteredUsername, String enteredPassword) async {
    // Replace 'your_username' and 'your_password' with your desired username and password
    String validUsername = 'abylsen';
    String validPassword = 'abylsen';

    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      // Authentication successful
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('authenticated', true);
      } catch (e) {
        print('Error accessing SharedPreferences: $e');
      }

      return true;
    } else {
      // Authentication failed
      return false;
    }
  }

}
