import 'package:flutter/material.dart';
import 'package:meal_app/providers/bottom_provider.dart';
import 'package:provider/provider.dart';

import '../Widget/drawer.dart';
import 'catogery_screan.dart';
import 'favorite_screen.dart';

class FirstPage extends StatelessWidget {
   FirstPage({Key? key}) : super(key: key);
   static const routeName="FirstPage";
  List bottomPage= [const CategeoryScrean(),FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    //print(Provider.of<BottomProvider>(context).currentIndex);
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "Favorite"),
        ],
        currentIndex: Provider.of<BottomProvider>(context).currentIndex,
        onTap: (index)=>Provider.of<BottomProvider>(context,listen: false).changeIndex(index),
      ),
      appBar: AppBar(
        title: const Text("Meal App"),
        elevation: 200,
      ),
      drawer: CustomDrawer() ,
      body:  bottomPage[Provider.of<BottomProvider>(context).currentIndex],
    );
  }
}
