import 'dart:convert';

class FacilitiesModel {
  bool? status;
  int? count;
  List<Datum>? data;

  FacilitiesModel({
    this.status,
    this.count,
    this.data,
  });

  factory FacilitiesModel.fromJson(String str) =>
      FacilitiesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FacilitiesModel.fromMap(Map<String, dynamic> json) => FacilitiesModel(
        status: json["status"],
        count: json["count"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "count": count,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  String? id;
  String? size;
  String? name;
  String? location;
  String? description;
  String? tel;
  String? owner;
  String? imgUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.size,
    this.name,
    this.location,
    this.description,
    this.tel,
    this.owner,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        size: json["size"],
        name: json["name"],
        location: json["location"],
        description: json["description"],
        tel: json["tel"],
        owner: json["owner"],
        imgUrl: json["imgUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "size": size,
        "name": name,
        "location": location,
        "description": description,
        "tel": tel,
        "owner": owner,
        "imgUrl": imgUrl,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
