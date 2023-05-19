// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<CoursesModel> getcourses(String category, String subcategory) async {
//   var client = http.Client();
//   // set uli string
//   final Uri url =
//       Uri.parse("$baseurl$course?category=$category&subCategory=$subcategory");

//   try {
//     var response = await client.get(url);
//     // print(response.body.toString());
//     if (response.statusCode == 200) {
//       CoursesModel data = CoursesModel.fromMap(json.decode(response.body));
//       return data;
//     } else {
//       return CoursesModel(status: false);
//     }
//   } catch (e) {
//     throw Exception(e);
//   }
// }
