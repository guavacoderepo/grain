import 'dart:convert';

class FarmersModel {
  bool? status;
  int? count;
  List<Datum>? data;

  FarmersModel({
     this.status,
     this.count,
     this.data,
  });

  factory FarmersModel.fromJson(String str) => FarmersModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FarmersModel.fromMap(Map<String, dynamic> json) => FarmersModel(
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
  String? name;
  String? specie;
  DateTime? plantDate;
  String? location;
  String? farmSize;
  String? description;
  String? owner;
  String? tel;
  DateTime? cropDuration;
  String? imgUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
     this.id,
     this.name,
     this.specie,
     this.plantDate,
     this.location,
     this.farmSize,
     this.description,
     this.owner,
     this.tel,
     this.cropDuration,
     this.imgUrl,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        specie: json["specie"],
        plantDate: DateTime.parse(json["plantDate"]),
        location: json["location"],
        farmSize: json["farmSize"],
        description: json["description"],
        owner: json["owner"],
        tel: json["tel"],
        cropDuration: DateTime.parse(json["cropDuration"]),
        imgUrl: json["imgUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "specie": specie,
        "plantDate": plantDate!.toIso8601String(),
        "location": location,
        "farmSize": farmSize,
        "description": description,
        "owner": owner,
        "tel": tel,
        "cropDuration": cropDuration!.toIso8601String(),
        "imgUrl": imgUrl,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}
