import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infoprark_api_task/model/home_screen_model/home_Screen_model.dart';

class HomescreenController with ChangeNotifier {
  SingleResProductAllMain? allproducts;
  bool isloading = false;
  bool categoryisloading = false;
  List categorieslist = ["ALL"];

  // Future<void> getAllProducts(BuildContext context,
  //     {String category = ''}) async {
  //   try {
  //     isloading = true;
  //     notifyListeners();

  //     final allurl =
  //         Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');

  //     final Categoryurl = Uri.parse(
  //         'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');

  //     final url = category.isEmpty ? allurl : Categoryurl;
  //     final response = await http.get(url);

  //     if (response.statusCode == 200) {
  //       allproducts = singleResProductAllMainFromJson(response.body);
  //     } else {
  //       throw Exception('Failed to fetch products');
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error loading products: ${e.toString()}'),
  //         duration: const Duration(seconds: 3),
  //       ),
  //     );
  //   } finally {
  //     isloading = false;
  //     notifyListeners();
  //   }
  // }
  Future<void> getAllProducts(BuildContext context,
      {String category = ''}) async {
    try {
      isloading = true;
      notifyListeners();

      final url = category.isEmpty
          ? Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php')
          : Uri.parse(
              'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Parse response based on the endpoint
        if (category.isEmpty) {
          // All categories response
          allproducts = SingleResProductAllMain.fromJson(data);
        } else {
          // Category-specific response
          final meals = data["meals"] as List?;
          if (meals != null) {
            allproducts = SingleResProductAllMain(
              categories: meals.map((meal) {
                return Category(
                  idCategory: meal["idMeal"],
                  strCategory: meal["strMeal"],
                  strCategoryThumb: meal["strMealThumb"],
                  strCategoryDescription: "", // No description in this endpoint
                );
              }).toList(),
            );
          } else {
            allproducts = SingleResProductAllMain(categories: []);
          }
        }
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading products: ${e.toString()}'),
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> getCategories() async {
    categoryisloading = true;
    notifyListeners();
    try {
      final url =
          Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final categories = data["categories"] as List;
        categorieslist = ["ALL"]; // for showing all in first
        categorieslist.addAll(
          categories.map((e) => e["strCategory"] as String).toList(),
        );
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
    } finally {
      categoryisloading = false;
      notifyListeners();
    }
  }
}
