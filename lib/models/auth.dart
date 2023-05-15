import 'dart:async';
import 'package:grain/constants/url.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Authentication {
  var client = http.Client();

  Future registerUser(name, email, username, token, pwd) async {
    // set uli string
    final Uri url = Uri.parse(baseurl + register);

    try {
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "fullName": name,
          "email": email,
          "username": username,
          "token": token,
          "password": pwd
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        var user = UserModel.fromMap(responseData["data"]);
        return {
          "status": true,
          "token": responseData["token"],
          "data": user,
        };
      } else {
        return {
          "status": false,
          "data": responseData['msg'],
        };
      }
    } catch (e) {
      // print(e.toString());
      return {
        "status": false,
        "data": e.toString(),
      };
    } finally {
      // print("here");
      client.close();
    }
  }

// login function section
  Future<Map<String, dynamic>> loginUser(email, pwd) async {
    // set uli string
    final Uri url = Uri.parse(baseurl + login);

    try {
      var response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "email": email,
          "password": pwd,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        var user = UserModel.fromMap(responseData["data"]);

        return {
          "status": true,
          "token": responseData["token"],
          "data": user,
        };
      } else {
        return {
          "status": false,
          "data": responseData['msg'],
        };
      }
    } catch (e) {
      // print(e.toString());
      return {
        "status": false,
        "data": e.toString(),
      };
    } finally {
      // print("here");
      client.close();
    }
  }
}
