import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/url.dart';
import '../utilities/sharepref.dart';

Future uploadFarm(name, specie, pdate, location, size, desc, owner, tel,
    duration, img) async {
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
        "body": {
          "name": name,
          "specie": specie,
          "plantDate": pdate,
          "location": location,
          "farmSize": size,
          "description": desc,
          "owner": owner,
          "tel": tel,
          "cropDuration": duration,
          "imgUrl": img
        },
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

Future uploadFacility(name, specie, pdate, location, size, desc, owner, tel,
    duration, img) async {
  var client = http.Client();

  try {
    String token = await retriveToken();
    var uri = Uri.parse("$baseurl$updateuser");

    var res = await client.put(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        "body": {
          "name": name,
          "specie": specie,
          "plantDate": pdate,
          "location": location,
          "farmSize": size,
          "description": desc,
          "owner": owner,
          "tel": tel,
          "cropDuration": duration,
          "imgUrl": img
        },
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
