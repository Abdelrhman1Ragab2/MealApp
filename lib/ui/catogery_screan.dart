import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/ui/category_meals_screan.dart';

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
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 6,
            crossAxisSpacing: 20,
            mainAxisExtent: 200,
            mainAxisSpacing: 30),
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }

  Widget categoryItem(BuildContext context, Category category) {
    return InkWell(
      onTap: () => selectCategory(context, category),
      child: Column(
        children: [
          Image.network(
            category.imageUrl,
            fit: BoxFit.cover,
            height: 170,
            width: 170,
          ),
          SizedBox(
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
  }
}
