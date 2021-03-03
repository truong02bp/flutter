import 'package:ecommerce/screens/splash/components/body.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/size_config.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
