import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';


class FavoriteProvider with ChangeNotifier{

  List<String> mealIds=[];

  void onSelectFavorite(Meal meal)
  {
    if(!meal.isFavorite)
      {
        mealIds.add(meal.id);

      }
    else{
      mealIds.remove(meal.id);
    }
    meal.isFavorite=!meal.isFavorite;
    notifyListeners();

  }

}