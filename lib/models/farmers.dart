import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/url.dart';
import '../datamodels/farmersModel.dart';

Future<FarmersModel> famersClass() async {
  var client = http.Client();
  // set uli string
  final Uri url = Uri.parse("$baseurl$famers");

  try {
    var response = await client.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      FarmersModel data = FarmersModel.fromMap(json.decode(response.body));
      return data;
    } else {
      FarmersModel data = FarmersModel.fromMap(json.decode(response.body));
      return data;
    }
  } catch (e) {
    throw Exception(e);
  }
}
