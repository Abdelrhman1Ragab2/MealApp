import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';

class MealsServices {
  List<Meal> filterMealsByCategoryId(List<Meal> meals, String categoryId) {
    return meals.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
  }

  List<Meal> filterMealsByFavoriteMealsId(List<Meal> meals, List<String> mealsId) {
    List<Meal> Favoritemeals=[];
    Favoritemeals.addAll( meals.where((element) {
      return mealsId.contains(element.id);
    }).toList());
     print("Favorite meals :  $Favoritemeals");
    print("all meals :  $meals");
    print("Meals ids :  $mealsId");
    return Favoritemeals;

  }

  Meal filterMealByMealId(List<Meal> meals, String mealId) {
    return meals.firstWhere((element) {
      return element.id==mealId;
    });
  }

  String mapComplexityMealToString(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
    }
  }

  String mapAffordabilityMealToString(Affordability affordability) {
    switch (affordability) {
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
    }
  }
}
