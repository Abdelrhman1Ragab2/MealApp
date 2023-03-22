
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/services/mealsServices.dart';

import '../models/dummy_data.dart';
import '../models/meal.dart';

class MealsDeatails extends StatelessWidget {
   MealsDeatails({Key? key}) : super(key: key);
  static const routeName="MealsDetailsRoute";
  MealsServices _mealsServices =MealsServices();

  @override
  Widget build(BuildContext context) {
  final mealId=ModalRoute.of(context)!.settings.arguments as String;
  Meal meal =_mealsServices.filterMealByMealId(DUMMY_MEALS, mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: buildBody(context,meal),
    );
  }
  Widget buildBody(BuildContext context,Meal meal){
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.all(8),
                child: Image.network(meal.imageUrl,height: 200,width: double.maxFinite,fit: BoxFit.cover,)),
            const SizedBox(height: 10,),
            const Text("meal components",
              style:  TextStyle(
                  fontSize: 22,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 200,
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(15),

              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.blueGrey,
                    child: Text(meal.ingredients[index],
                    style: const TextStyle(
                      fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,

                    ),),
                  ),
                  separatorBuilder:(context, index) =>SizedBox(height: 10,) ,
                  itemCount: meal.ingredients.length),
            ),
            const SizedBox(height: 20,),
            const Text("Preparation steps",
              style:  TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,

              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 200,
              width: 300,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(15),

              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Center(child: Text("${index}",
                          style:  const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                            color: Colors.white,

                        ),
                        )),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          
                        ),
                        child: Text(meal.steps[index]
                        ,// overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ],
                  ),
                  separatorBuilder:(context, index) =>SizedBox(height: 10,) ,
                  itemCount: meal.steps.length),
            )
          ],
        ),
      ),
    );
  }
}
