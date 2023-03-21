import 'package:flutter/material.dart';

import 'catogery_screan.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CategeoryScrean(),
    );
  }
}