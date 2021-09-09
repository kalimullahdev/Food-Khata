import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_khata/presentation/pages/home_page.dart';
import 'package:food_khata/presentation/widgets/custom_progress_indicator.dart';
import 'package:food_khata/presentation/widgets/custom_text.dart';
import 'package:food_khata/presentation/widgets/logo_image.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe0e0e0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CustomText(text: "Food Khata"),
            SizedBox(height: 24),
            LogoImage(),
            SizedBox(height: 24),
            CustomCircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
