import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesController with ChangeNotifier {
  Future<void> getCategories({String category = ''}) async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef');
    final Response = await http.get(url);
    if (Response.statusCode == 200) {}
  }
}
