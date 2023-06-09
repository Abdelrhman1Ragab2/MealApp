import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/providers/FavoriteProvider.dart';
import 'package:provider/provider.dart';

import '../models/dummy_data.dart';
import '../models/meal.dart';
import '../services/mealsServices.dart';
import 'meals_details.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final MealsServices _mealsServices = MealsServices();
  static const routeName = "FavoriteScreen";

  @override
  Widget build(BuildContext context) {
    List<String> mealsIds = Provider.of<FavoriteProvider>(context).mealIds;
    return mealsIds.isEmpty?const Center(child: Text("Empty Favorite Meals..."),):Container(
        child: ListView.separated(
      itemBuilder: (context, index) => mealsItem(
          context,
          _mealsServices.filterMealsByFavoriteMealsId(
              DUMMY_MEALS, mealsIds)[index]),
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
      itemCount: mealsIds.length,
    ));
  }

  Widget mealsItem(BuildContext context, Meal meal) {
    return Container(
      child: InkWell(
        onTap: () => onSelectMeal(context, meal.id),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(meal.imageUrl,
                    height: 200, width: double.maxFinite, fit: BoxFit.fill),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.black54,
                  child: Text(
                    meal.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Card(
                elevation: 800,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text("${meal.duration} min"),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Row(
                        children: [
                          Icon(Icons.subject),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_mealsServices
                              .mapComplexityMealToString(meal.complexity)),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Row(
                        children: [
                          Icon(Icons.monetization_on_rounded),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_mealsServices.mapAffordabilityMealToString(
                              meal.affordability)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSelectMeal(BuildContext context, String mealId) {
    Navigator.of(context).pushNamed(MealsDeatails.routeName, arguments: mealId);
  }
}
