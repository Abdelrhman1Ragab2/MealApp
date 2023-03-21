import 'package:flutter/material.dart';
import 'package:meal_app/ui/category_meals_screan.dart';
import 'package:meal_app/ui/catogery_screan.dart';
import 'package:meal_app/ui/first_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/':(context)=> FirstPage(),
        CategeoryScrean.routeName :(context)=>CategeoryScrean(),
        CategoryMealsScrean.routeName:(context)=>CategoryMealsScrean(),


        },
      //home: FirstPage(),
    );
  }
}

