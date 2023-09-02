import 'package:flutter/material.dart';

import 'dishes.dart';

class CategoryBundle {
  final int id;
  final String title, description, chef, imageSrc;
  final Color color;
  int reciepes;

  CategoryBundle(
      {required this.id,
      required this.chef,
      required this.reciepes,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color});
}

List<CategoryBundle> categoryBundles = [
  CategoryBundle(
    id: 1,
    chef: "Sorin Bontea",
    reciepes: 0,
    title: "Tasty and new",
    description: "Cook for your family",
    imageSrc: "images/bonteaCaricatura1.jpg",
    color: Color(0XFF602215),
  ),
  CategoryBundle(
    id: 2,
    chef: "Florin Dumitrescu",
    reciepes: 0,
    title: "Best of 2023",
    description: "Cook recipes for special occasions",
    imageSrc: "images/dumitrescuCaricatura1.jpg",
    color: Color(0XFF602215),
  ),
  CategoryBundle(
    id: 3,
    chef: "Catalin Scarlatescu",
    reciepes: 0,
    title: "Food Court",
    description: "Your favorite food dish, make it now",
    imageSrc: "images/scarlatescuCaricatura.jpg",
    color: Color(0XFF602215),
  ),
];

void updateReciepesCount(List<Dish> recipes) {
  for (CategoryBundle bundle in categoryBundles) {
    final chefName = bundle.chef;
    final chefRecipes =
        recipes.where((recipe) => recipe.chef == chefName).toList();
    bundle.reciepes = chefRecipes.length;
  }
}
