import 'dart:convert';
import 'package:grain/constants/url.dart';
// import 'package:grain/utils/sharepref.dart';
import 'package:http/http.dart' as http;

// request for token
Future fotgotPassword(email) async {
  var client = http.Client();

  try {
    var uri = Uri.parse("$baseurl$forgotpwd");

    var res = await client.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode({
        "email": email,
      }),
    );

    Map<dynamic, dynamic> resdata = json.decode(res.body);

    if (res.statusCode == 200) {
      return resdata;
    } else {
      return resdata;
    }
  } catch (e) {
    return {"status": false, "msg": e.toString()};
  } finally {
    client.close();
  }
}

// send forgot password token to email

Future fotgotPasswordToken(inputtoken) async {
  var client = http.Client();

  try {
    var uri = Uri.parse("$baseurl$pwdtoken$inputtoken");

    var res = await client.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    Map<dynamic, dynamic> resdata = json.decode(res.body);

    if (res.statusCode == 200) {
      return resdata;
    } else {
      return resdata;
    }
  } catch (e) {
    return {"status": false, "msg": e.toString()};
  } finally {
    client.close();
  }
}

// reset forgot password

Future resetpwd(newpwd) async {
  var client = http.Client();

  try {
    // String token = await retriveForgotToken();

    var uri = Uri.parse("$baseurl$resetpassword");

    var res = await client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
      },
      body: json.encode({
        "password": newpwd,
      }),
    );

    Map<dynamic, dynamic> resdata = json.decode(res.body);

    if (res.statusCode == 200) {
      return resdata;
    } else {
      return resdata;
    }
  } catch (e) {
    return {"status": false, "msg": e.toString()};
  } finally {
    client.close();
  }
}
