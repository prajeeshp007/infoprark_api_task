// To parse this JSON data, do
//
//     final singleResProductAllMain = singleResProductAllMainFromJson(jsonString);

import 'dart:convert';

SingleResProductAllMain singleResProductAllMainFromJson(String str) =>
    SingleResProductAllMain.fromJson(json.decode(str));

String singleResProductAllMainToJson(SingleResProductAllMain data) =>
    json.encode(data.toJson());

class SingleResProductAllMain {
  List<Category>? categories;

  SingleResProductAllMain({
    this.categories,
  });

  factory SingleResProductAllMain.fromJson(Map<String, dynamic> json) =>
      SingleResProductAllMain(
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        "strCategoryDescription": strCategoryDescription,
      };
}
