import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/url.dart';
import '../datamodels/facilitieModel.dart';

Future<FacilitiesModel> getFacilities() async {
  var client = http.Client();
  // set uli string
  final Uri url = Uri.parse("$baseurl$facilities");

  try {
    var response = await client.get(url);
    // print(response.body.toString());
    if (response.statusCode == 200) {
      FacilitiesModel data =
          FacilitiesModel.fromMap(json.decode(response.body));
      return data;
    } else {
      return FacilitiesModel(status: false);
    }
  } catch (e) {
    throw Exception(e);
  }
}
