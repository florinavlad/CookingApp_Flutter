import 'package:flutter/material.dart';

class CategoryBundle {
  final int id, ingredients;
  final String title, description, chef, imageSrc;
  final Color color;

  CategoryBundle(
      {required this.id,
      required this.chef,
      required this.ingredients,
      required this.title,
      required this.description,
      required this.imageSrc,
      required this.color});
}

List<CategoryBundle> categoryBundles = [
  CategoryBundle(
    id: 1,
    chef: "Sorin Bontea",
    ingredients: 95,
    title: "Tasty and new",
    description: "Cook for your family",
    imageSrc: "images/bonteaCaricatura1.jpg",
    color: Color(0XFF602215),
  ),
  CategoryBundle(
    id: 2,
    chef: "Florin Dumitrescu",
    ingredients: 26,
    title: "Best of 2023",
    description: "Cook recipes for special occasions",
    imageSrc: "images/dumitrescuCaricatura1.jpg",
    color: Color(0XFF602215),
  ),
  CategoryBundle(
    id: 3,
    chef: "Cătălin Scărlătescu",
    ingredients: 43,
    title: "Food Court",
    description: "Your favorite food dish, make it now",
    imageSrc: "images/scarlatescuCaricatura.jpg",
    color: Color(0XFF602215),
  ),
];
