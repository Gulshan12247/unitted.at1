import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/uni/allScreens/appScreen.dart';

import 'homeScreen1.dart';
import 'loginScrren1.dart';


class splashscreen1 extends StatefulWidget {
  const splashscreen1({super.key});

  @override
  State<splashscreen1> createState() => _splashscreen1State();
}

class _splashscreen1State extends State<splashscreen1> {
  @override
  void initState() {
    super.initState();
    token ();
  }

  void token() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');

    if (token != null && token.isNotEmpty) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const appScreen()));
      }
      );
    }
    else {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login1()));
      }
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: SafeArea(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
