import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/dishes.dart';

Future<List<Dish>> fetchDishes() async {
  const String apiUrl =
      "https://64c68b450a25021fde91c00e.mockapi.io/api/recipes/Dish";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<Dish> dishes = (json.decode(response.body) as List)
        .map((data) => Dish.fromJson(data))
        .toList();

    return dishes;
  } else {
    throw Exception('Failed to load');
  }
}
