import 'dart:convert';

class UserModel {
    String fullName;
    String email;
    dynamic tel;
    String category;
    bool isNotification;
    List<dynamic> bookmark;
    List<dynamic> post;
    dynamic imgUrl;
    dynamic address;
    String password;
    bool isActive;
    dynamic resetPasswordToken;
    dynamic resetPasswordExpire;
    String id;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    UserModel({
        required this.fullName,
        required this.email,
        required this.tel,
        required this.category,
        required this.isNotification,
        required this.bookmark,
        required this.post,
        required this.imgUrl,
        required this.address,
        required this.password,
        required this.isActive,
        required this.resetPasswordToken,
        required this.resetPasswordExpire,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        fullName: json["fullName"],
        email: json["email"],
        tel: json["tel"],
        category: json["category"],
        isNotification: json["isNotification"],
        bookmark: List<dynamic>.from(json["bookmark"].map((x) => x)),
        post: List<dynamic>.from(json["post"].map((x) => x)),
        imgUrl: json["imgUrl"],
        address: json["address"],
        password: json["password"],
        isActive: json["isActive"],
        resetPasswordToken: json["resetPasswordToken"],
        resetPasswordExpire: json["resetPasswordExpire"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "fullName": fullName,
        "email": email,
        "tel": tel,
        "category": category,
        "isNotification": isNotification,
        "bookmark": List<dynamic>.from(bookmark.map((x) => x)),
        "post": List<dynamic>.from(post.map((x) => x)),
        "imgUrl": imgUrl,
        "address": address,
        "password": password,
        "isActive": isActive,
        "resetPasswordToken": resetPasswordToken,
        "resetPasswordExpire": resetPasswordExpire,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}