import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/filterProvider.dart';

class FiltrationScreen extends StatelessWidget {
   FiltrationScreen({Key? key}) : super(key: key);
  static const routeName = "FiltrationScreen";


  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<FilterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtration"),
      ),
      body: Container(
        height: double.maxFinite,
        child: Column(
          children: [
            const SizedBox(height: 30,),
            const Text("Adjust your meal selections",
              style:  TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,color: Colors.black
              ),),
            const SizedBox(height: 30,),
            filterItem(context, "isGlutenFree", "only include isGlutenFree meals ",pro.isGlutenFree,"id1"),
            const SizedBox(height: 10,),
            filterItem(context, "isVegan", "only include isVegan meals ",pro.isVegan,"id2"),
            const SizedBox(height: 10,),
            filterItem(context, "isVegetarian", "only include isVegetarian meals ",pro.isVegetarian,"id3"),
            const SizedBox(height: 10,),
            filterItem(context, "isLactoseFree", "only include isLactoseFree meals ",pro.isLactoseFree,"id4"),


          ],
        ),
      ),
    );
  }

  Widget filterItem(BuildContext context, String title, String info,bool filter,String id) {
    return Container(
      padding: EdgeInsets.only(right: 15,left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title,style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,color: Colors.black
          ),),
          Row(
            children: [
              Container(
                width: 250,
                child: Text(info,style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,color: Colors.grey
                ),),
              ),
              const SizedBox(width: 10,),
              Switch(value:filter,
                  onChanged:(value)=>Provider
                      .of<FilterProvider>(context,listen: false).changeFilter(value,id)
              )

            ],
          ),
        ],
      ),
    );
  }
}
