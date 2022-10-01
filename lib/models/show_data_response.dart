// To parse this JSON data, do
//
//     final showDataResponse = showDataResponseFromJson(jsonString);

import 'dart:convert';

ShowDataResponse showDataResponseFromJson(String str) =>
    ShowDataResponse.fromJson(json.decode(str));

String showDataResponseToJson(ShowDataResponse data) =>
    json.encode(data.toJson());

class ShowDataResponse {
  ShowDataResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<Datum> data;

  factory ShowDataResponse.fromJson(Map<String, dynamic> json) =>
      ShowDataResponse(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.slug,
    required this.image,
    required this.description,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    required this.getCategory,
  });

  int id;
  String title;
  String slug;
  String image;
  String description;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;
  GetCategory getCategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        description: json["description"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        getCategory: GetCategory.fromJson(json["get_category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "description": description,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "get_category": getCategory.toJson(),
      };
}

class GetCategory {
  GetCategory({
    required this.id,
    required this.code,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String code;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory GetCategory.fromJson(Map<String, dynamic> json) => GetCategory(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
