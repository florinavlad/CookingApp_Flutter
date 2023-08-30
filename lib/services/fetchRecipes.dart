import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/recipes.dart';

// Fetch Recipes from API
Future<List<Recipe>> fetchRecipe() async {
  const String apiUrl =
      "https://64c68b450a25021fde91c00e.mockapi.io/api/recipes/Recipe";

  final response = await http.get(apiUrl as Uri);

  if (response.statusCode == 200) {
    List<Recipe> recipes = (json.decode(response.body) as List)
        .map((data) => Recipe.fromJson(data))
        .toList();

    return recipes;
  } else {
    throw Exception('Failed to load');
  }
}
