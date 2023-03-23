import 'package:flutter/cupertino.dart';

import '../ui/filteration_page.dart';

class FilterProvider with ChangeNotifier{
  bool isGlutenFree=false;
  bool isVegan=false;
  bool isVegetarian=false;
  bool isLactoseFree=false;
  void changeFilter(bool changedFilter,String id)
  {

    switch(id)
    {
      case "id1":
        isGlutenFree=changedFilter;
        break;
      case "id2":
        isVegan=changedFilter;
        break;
      case "id3":
        isVegetarian=changedFilter;
        break;
      case "id4":
        isLactoseFree=changedFilter;
        break ;

    }
    notifyListeners();
  }
}