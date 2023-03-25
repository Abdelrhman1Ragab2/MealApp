import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/providers/splashProvider.dart';
import 'package:provider/provider.dart';

import 'first_page.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _controller;
  var _animation;
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = Provider.of<SplashProvider>(context).size;
    Provider.of<SplashProvider>(context, listen: false).doAnimation();

    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: AnimatedContainer(
            width: size * 2,
            height: size * 2,
            color: Colors.white,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOutSine,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const[
                Icon(Icons.fastfood, size: 30),
                 SizedBox(height: 10),
                Text(
                  "MealApp",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
