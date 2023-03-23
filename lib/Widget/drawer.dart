import 'package:flutter/material.dart';
import 'package:meal_app/ui/info_screen.dart';
import 'package:meal_app/ui/settings.dart';

import '../ui/filteration_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                "https://iphone-image.apkpure.com/v2/app/8/e/9/8e9093d88f89bb6552e37b9dfb56bd56_639x1136.jpg"
          )
          )
        ),

        padding: const EdgeInsets.only(left: 4,right: 4,),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 100,
                  color: Colors.black54,
                  child: const Center(
                    child: Text(
                      "Meal App",
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              buildListTitle(
                  "Homepage",
                 const Icon(
                    Icons.home_rounded,
                  ),
                  context,"/"),
              const SizedBox(height: 10,),
              buildListTitle(
                  "Filtration",
                 const Icon(
                    Icons.filter_list_outlined,
                  ),
                  context,FiltrationScreen.routeName,),
              const SizedBox(height: 10,),
              buildListTitle(
                  "Settings",
                 const Icon(
                    Icons.settings,
                  ),
                context,Settings.routeName,
              ),
              const SizedBox(height: 10,),
              buildListTitle(
                  "About",
                 const Icon(
                    Icons.info,
                   size: 28,
                  ),
                context,InfoScreen.routeName
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTitle(String title, Widget iconData,BuildContext context,String routeName) {
    return Container(
      padding: const EdgeInsets.all(8),
      
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),

      ),
      child: ListTile(
        title: Text(title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
        leading: iconData,
        onTap: () => onSelectedItem(context, routeName),
        iconColor: Colors.blueGrey,
        textColor: Colors.white,
      ),
    );
  }

  void onSelectedItem(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
