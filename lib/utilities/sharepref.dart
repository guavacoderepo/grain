import 'package:shared_preferences/shared_preferences.dart';

// save user token id
Future saveToken(token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('token', token);
}
 
// retrive user's token id
Future<String> retriveToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('token') ?? "null";
  // print(token);
  return token;
}

// delete users token id
Future removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
}

// ##########################################################################

// save user ForgotToken id
Future saveForgotToken(token) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('ForgotToken', token);
}

// retrive user's ForgotToken id
Future<String> retriveForgotToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String token = prefs.getString('ForgotToken') ?? "null";
  // print(token);
  return token;
} 


// delete users ForgotToke n id
Future removeForgotToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('ForgotToken');
}
