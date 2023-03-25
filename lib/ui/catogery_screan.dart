import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/providers/filterProvider.dart';
import 'package:meal_app/ui/category_meals_screan.dart';
import 'package:provider/provider.dart';

import '../models/dummy_data.dart';

class CategeoryScrean extends StatelessWidget {
  static const routeName = "CategoryScrean";

  const CategeoryScrean({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryView(context);
  }

  Widget categoryView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: GridView.builder(
        itemBuilder: (context, index) =>
            categoryItem(context, DUMMY_CATEGORIES[index]),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            //childAspectRatio: 2 / 6,
            crossAxisSpacing: 20,
            mainAxisExtent: 200,
            mainAxisSpacing: 20),
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }

  Widget categoryItem(BuildContext context, Category category) {
    return InkWell(
      onTap: () => selectCategory(context, category),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey,
            ),
            child: Image.network(
              category.imageUrl,
              fit: BoxFit.fill,
              height: 170,
              width: 170,
            ),
          ),
         const SizedBox(
            height: 5,
          ),
          Text(
            category.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  void selectCategory(BuildContext context, Category category) {
    Navigator.of(context).pushNamed(CategoryMealsScrean.routeName,
        arguments: {"id": category.id, "title": category.title});
    print("i her");
    print(Provider.of<FilterProvider>(context,listen: false).Meals.length);
  }
}
