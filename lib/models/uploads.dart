import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/url.dart';
import '../utilities/sharepref.dart';

Future uploadFarm(name, specie, DateTime pdate, location, size, desc, owner,
    tel, DateTime duration, img) async {
  var client = http.Client();

  try {
    String token = await retriveToken();
    var uri = Uri.parse("$baseurl$famers");

    var res = await client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        "name": name,
        "specie": specie,
        "plantDate": pdate.toIso8601String(),
        "location": location,
        "farmSize": size,
        "description": desc,
        "owner": owner,
        "tel": tel,
        "cropDuration": duration.toIso8601String(),
        "imgUrl": img
      }),
    );

    if (res.statusCode == 200) {
      return {"status": true};
    } else {
      return {"status": false};
    }
  } catch (e) {
    return {"status": false};
  } finally {
    client.close();
  }
}

Future uploadFacility(name, location, size, desc, owner, tel, img) async {
  var client = http.Client();

  try {
    String token = await retriveToken();
    var uri = Uri.parse("$baseurl$facilities");

    var res = await client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        "name": name,
        "size": size,
        "location": location,
        "description": desc,
        "imgUrl": img,
        "owner": owner,
        "tel": tel
      }),
    );

    if (res.statusCode == 200) {
      return {"status": true};
    } else {
      return {"status": false};
    }
  } catch (e) {
    return {"status": false};
  } finally {
    client.close();
  }
}
