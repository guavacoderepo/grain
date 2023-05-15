import 'dart:convert';

class HealthTipsModel {
  bool? status;
  int? count;
  List<Datum>? data;

  HealthTipsModel({
     this.status,
     this.count,
     this.data,
  });

  factory HealthTipsModel.fromJson(String? str) => HealthTipsModel.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory HealthTipsModel.fromMap(Map<String?, dynamic> json) => HealthTipsModel(
        status: json["status"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String?, dynamic> toMap() => {
        "status": status,
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  String? id;
  String? title;
  String? category;
  String? status;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
     this.id,
     this.title,
     this.category,
     this.status,
     this.description,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory Datum.fromJson(String? str) => Datum.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String?, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        category: json["category"],
        status: json["status"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String?, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "category": category,
        "status": status,
        "description": description,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
