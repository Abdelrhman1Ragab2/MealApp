import 'package:flutter/cupertino.dart';

class SplashProvider with ChangeNotifier{
  double size=50;

  void doAnimation()
  {
    size=150;
    notifyListeners();
  }
}