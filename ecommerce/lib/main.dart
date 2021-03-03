import 'package:ecommerce/screens/splash/splash.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor)
        )
      ),
      home: Scaffold(
        body: SplashScreen()
      ),
    );
  }
}
