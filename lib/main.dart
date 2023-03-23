import 'package:flutter/material.dart';
import 'package:meal_app/providers/FavoriteProvider.dart';
import 'package:meal_app/providers/bottom_provider.dart';
import 'package:meal_app/ui/category_meals_screan.dart';
import 'package:meal_app/ui/catogery_screan.dart';
import 'package:meal_app/ui/favorite_screen.dart';
import 'package:meal_app/ui/first_page.dart';
import 'package:meal_app/ui/meals_details.dart';
import 'package:provider/provider.dart';

void main() {
  //Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<BottomProvider>(create: (_) => BottomProvider()),
      ChangeNotifierProvider<FavoriteProvider>(create: (_) => FavoriteProvider()),

    ],
    child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.blueGrey,
      )),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => FirstPage(),
        CategeoryScrean.routeName: (context) => const CategeoryScrean(),
        CategoryMealsScrean.routeName: (context) => CategoryMealsScrean(),
        MealsDeatails.routeName: (context) => MealsDeatails(),
        FavoriteScreen.routeName: (context) => FavoriteScreen(),

      },
      //home: FirstPage(),
    );
  }
}
