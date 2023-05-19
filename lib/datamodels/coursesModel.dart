import 'dart:convert';

class CoursesModel {
  bool? status;
  int? count;
  List<Datum>? data;

  CoursesModel({
    this.status,
    this.count,
    this.data,
  });

  factory CoursesModel.fromJson(String? str) =>
      CoursesModel.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory CoursesModel.fromMap(Map<String?, dynamic> json) => CoursesModel(
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
  String? name;
  Category? category;
  SubCategory? subCategory;
  String? description;
  String? imgUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.name,
    this.category,
    this.subCategory,
    this.description,
    this.imgUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(String? str) => Datum.fromMap(json.decode(str!));

  String? toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String?, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        category: categoryValues.map[json["category"]],
        subCategory: subCategoryValues.map[json["subCategory"]],
        description: json["description"],
        imgUrl: json["imgUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String?, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "category": categoryValues.reverse[category],
        "subCategory": subCategoryValues.reverse[subCategory],
        "description": description,
        "imgUrl": imgUrl,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
      };
}

enum Category { Beginners, Intermediate, Expert }

final categoryValues = EnumValues({
  "beginners": Category.Beginners,
  "expert": Category.Expert,
  "intermediate": Category.Intermediate
});

enum SubCategory { AB, Butt, Leg, Full }

final subCategoryValues = EnumValues({
  "ab": SubCategory.AB,
  "butt": SubCategory.Butt,
  "full": SubCategory.Full,
  "leg": SubCategory.Leg
});

class EnumValues<T> {
  Map<String?, T> map;
  late Map<T, String?> reverseMap;

  EnumValues(this.map);

  Map<T, String?> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
