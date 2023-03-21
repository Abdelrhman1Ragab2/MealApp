
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryMealsScrean extends StatelessWidget {
  static const routeName="CategoryMealsScrean";
   CategoryMealsScrean({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final routearg= ModalRoute.of(context)!.settings.arguments as Map<String,String>;

`
    return Scaffold(
      appBar: AppBar(
        title: Text(routearg["title"]!),
      ),
      body: Container(

      ),
    );

  }
}
