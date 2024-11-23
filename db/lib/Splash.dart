import 'dart:async';

import 'package:db/home.dart';
import 'package:db/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "login";
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 200,
            )
          ],
        ),
      ),
    );
  }

  whereToGo() async {
    var sharedprefs = await SharedPreferences.getInstance();
    var isLoggedIn = sharedprefs.getBool(KEYLOGIN);
      Timer(Duration(seconds: 2), () {
          if(isLoggedIn!=null){
        if(isLoggedIn){
                Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

        }else{
                Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
        }
      
    }else{
            Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    });
  }
}
