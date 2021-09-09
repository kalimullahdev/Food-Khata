import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_khata/blocs/auth/auth_bloc.dart';
import 'package:food_khata/injection.dart';
import 'package:food_khata/presentation/bottom_nav_bar.dart/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const BottomNavBar();
  }
}
