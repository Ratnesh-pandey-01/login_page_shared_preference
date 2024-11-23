import 'package:db/Splash.dart';
import 'package:db/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController uNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 50,
          right: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 90,
                )),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: uNameController,
              decoration: InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                onPressed: () async {
                  var sharedprefs = await SharedPreferences.getInstance();

                  sharedprefs.setBool(SplashScreenState.KEYLOGIN, true);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
