import 'dart:core';

import 'dart:core';

enum Complexity{
  Simple,
  Challenging,
  Hard,

}
enum Affordability{
  Affordable,
  Pricey,
  Luxurious
}




class Meal {
  String id;
  List<String> categories;
  String title;
  String imageUrl;
  List<String> ingredients;
  int duration;
  Complexity complexity;
  Affordability affordability;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  List<String> steps;

  Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.steps,
    required this.ingredients,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian

  });
}


