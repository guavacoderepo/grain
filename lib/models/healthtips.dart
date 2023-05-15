// import 'dart:convert';

// import 'package:embraceher/constants/url.dart';
// import 'package:embraceher/datamodels/healthtipsModel.dart';
// import 'package:http/http.dart' as http;

// Future<HealthTipsModel> getHealthtips(String category, String status) async {
//   var client = http.Client();
//   // set uli string
//   final Uri url =
//       Uri.parse("$baseurl$health?category=$category&status=$status");

//   try {
//     var response = await client.get(url);
//     // print(response.body.toString());
//     if (response.statusCode == 200) {
//       HealthTipsModel data =
//           HealthTipsModel.fromMap(json.decode(response.body));
//       return data;
//     } else {
//       return HealthTipsModel(status: false);
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
// }
