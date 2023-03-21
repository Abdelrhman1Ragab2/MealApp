import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';

class MealsServices{

  List<Meal> filterMealsByCategoryID(List<Meal> meals,String categoryId){
   return meals.where((element) {
      return element.categories.contains(categoryId);
    } ).toList();



  }

  String mapComplexityMealToString(Complexity complexity){

    switch(complexity){
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";

    }
  }


  String mapAffordabilityMealToString(Affordability affordability){

    switch(affordability){
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";

    }
  }

}