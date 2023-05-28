import 'package:expenser_113/constants.dart';
import 'package:expenser_113/screen/home/home_page.dart';
import 'package:expenser_113/screen/user_onboard/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APPNAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 43)
        ),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

