import 'package:grain/constants/url.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../utilities/sharepref.dart';

// call user function
Future users(context) async {
  var client = http.Client();

  String token = await retriveToken();

  try {
    var response = await client.get(Uri.parse(baseurl + getme), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var user = UserModel.fromMap(responseData["data"]);

      await saveToken(responseData["token"]);
      Provider.of<User>(context, listen: false).setUser(user);
      // user
      return {
        "status": true,
        "token": responseData["token"],
        "data": user,
      };
      // else return false
    } else {
      return {
        "status": false,
        "data": responseData['msg'],
      };
    }
  } catch (e) {
    throw Exception(e);
  } finally {
    client.close();
  }
}

// notifier
class User extends ChangeNotifier {
  // intance of the user model
  UserModel _user = UserModel();

  UserModel get user => _user;

// call user function
  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
