import 'package:flutter/material.dart';
import 'package:food_khata/presentation/pages/intro_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Khata',
      theme: ThemeData(
        primaryColor: const Color(0xffff6347),
      ),
      home: const IntroPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
