import 'package:flutter/cupertino.dart';

import '../models/dummy_data.dart';
import '../models/meal.dart';
import '../ui/filteration_page.dart';

class FilterProvider with ChangeNotifier{
  bool isGlutenFree=false;
  bool isVegan=false;
  bool isVegetarian=false;
  bool isLactoseFree=false;
  bool isChoiceFilter=false;
  List<Meal> Meals=DUMMY_MEALS;

   filterMealsByGlutenFree(String id)
  {
    print("i inside filtration method");
    switch(id)
    {
      case "id1":
        Meals= DUMMY_MEALS.where((element) {
          return element.isGlutenFree==true;
        }).toList();
        break;
      case "id2":
        Meals= DUMMY_MEALS.where((element) {
          return element.isVegan==true;
        }).toList();
        break;
      case "id3":
        Meals= DUMMY_MEALS.where((element) {
          return element.isVegetarian==true;
        }).toList();
        break;
      case "id4":
        Meals= DUMMY_MEALS.where((element) {
          return element.isLactoseFree==true;
        }).toList();
        break ;

    }
    notifyListeners();

  }
  void changeFilter(bool changedFilter,String id)
  {

    switch(id)
    {
      case "id1":
        isGlutenFree=changedFilter;
        filterMealsByGlutenFree(id);
        break;
      case "id2":
        isVegan=changedFilter;
        filterMealsByGlutenFree(id);
        break;
      case "id3":
        isVegetarian=changedFilter;
        filterMealsByGlutenFree(id);
        break;
      case "id4":
        isLactoseFree=changedFilter;
        filterMealsByGlutenFree(id);
        break ;
    }

    if(isGlutenFree==true||isVegan==true||isVegetarian==true||isLactoseFree==true)
    {
      isChoiceFilter=true;
    }
    else{
      isChoiceFilter=false;
    }
    filterMealsByGlutenFree(id);
    print(Meals.length);
    notifyListeners();
  }
}