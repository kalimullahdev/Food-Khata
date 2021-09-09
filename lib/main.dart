import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_khata/injection.dart';
import 'package:food_khata/presentation/app.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(App());
}


// flutter packages pub run build_runner watch --delete-conflicting-outputs  


//  primary 0xffff6347
//  secondry   0xffFF8C00

        //  MaterialStateProperty.all(Color(0xffFFB344)),
/// background color e0e0e0