// To parse this JSON data, do
//
//     final singleResProductAllMain = singleResProductAllMainFromJson(jsonString);

import 'dart:convert';

SingleResProductAllMain singleResProductAllMainFromJson(String str) =>
    SingleResProductAllMain.fromJson(json.decode(str));

String singleResProductAllMainToJson(SingleResProductAllMain data) =>
    json.encode(data.toJson());

class SingleResProductAllMain {
  List<Meal>? meals;

  SingleResProductAllMain({
    this.meals,
  });

  factory SingleResProductAllMain.fromJson(Map<String, dynamic> json) =>
      SingleResProductAllMain(
        meals: json["meals"] == null
            ? []
            : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": meals == null
            ? []
            : List<dynamic>.from(meals!.map((x) => x.toJson())),
      };
}

class Meal {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meal({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
