// import 'dart:convert';
// import 'package:embraceher/constants/url.dart';
// import 'package:embraceher/utils/sharepref.dart';
// import 'package:http/http.dart' as http;

// Future updateBodyInfo(weight, goalWeight, fitnessGoal, age) async {
//   var client = http.Client();

//   try {
//     String token = await retriveToken();
//     var uri = Uri.parse("$baseurl$updateuser");

//     var res = await client.put(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         "body": {
//           "weight": weight,
//           "goalWeight": goalWeight,
//           "fitnessGoal": fitnessGoal,
//           "age": age
//         },
//       }),
//     );

//     if (res.statusCode == 200) {
//       return {"status": true};
//     } else {
//       return {"status": false};
//     }
//   } catch (e) {
//     return {"status": false};
//   } finally {
//     client.close();
//   }
// }

// Future updateLocation(nationality, address, houseNumber, mailCode) async {
//   var client = http.Client();

//   try {
//     String token = await retriveToken();
//     var uri = Uri.parse("$baseurl$updateuser");

//     var res = await client.put(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         "loaction": {
//           "nationality": nationality,
//           "address": address,
//           "houseNumber": houseNumber,
//           "mailCode": mailCode
//         },
//       }),
//     );

//     if (res.statusCode == 200) {
//       return {"status": true};
//     } else {
//       return {"status": false};
//     }
//   } catch (e) {
//     return {"status": false};
//   } finally {
//     client.close();
//   }
// }

// Future editprofile(name, email, username, phone, img) async {
//   var client = http.Client();

//   try {
//     String token = await retriveToken();
//     var uri = Uri.parse("$baseurl$updateuser");

//     var res = await client.put(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         "fullName": name,
//         "email": email,
//         "username": username,
//         "phoneNumber": phone,
//         "imgUrl": img,
//       }),
//     );

//     print(res.body.toString());

//     if (res.statusCode == 200) {
//       return {"status": true};
//     } else {
//       return {"status": false};
//     }
//   } catch (e) {
//     return {"status": false};
//   } finally {
//     client.close();
//   }
// }

// Future changePWD(oldpwd, newpwd) async {
//   var client = http.Client();

//   try {
//     String token = await retriveToken();
//     var uri = Uri.parse("$baseurl$changepwd");

//     var res = await client.post(
//       uri,
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: json.encode({
//         "newpassword": newpwd,
//         "oldpassword": oldpwd,
//       }),
//     );

//     Map<dynamic, dynamic> resdata = json.decode(res.body);

//     if (res.statusCode == 200) {
//       return resdata;
//     } else {
//       return resdata;
//     }
//   } catch (e) {
//     return {"status": false, "msg": e.toString()};
//   } finally {
//     client.close();
//   }
// }
