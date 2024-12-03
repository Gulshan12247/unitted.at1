import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:untitled/Screen/comment_Screen.dart';
import 'package:untitled/Screen/home_Screen.dart';
import 'package:untitled/Screen/login_Screen.dart';
import 'package:untitled/Screen/siqnUp_Screen.dart';
import 'package:untitled/Screen/splashScreen.dart';
import 'package:untitled/Screen/updatePassword_Screen.dart';
import 'package:untitled/homePages/profileScreen.dart';
import 'package:untitled/uni/allScreens/appScreen.dart';
import 'package:untitled/uni/multipleScreens/profileScreen1.dart';
import 'package:untitled/uni/multipleScreens/splash1Screen.dart';

import 'uni/multipleScreens/splash1Screen.dart';





void main() {
  runApp(
  ProviderScope(
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splashscreen1()
    );
  }
}
