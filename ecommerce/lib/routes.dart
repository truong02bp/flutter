
import 'package:ecommerce/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce/screens/sign_in/sign_in.dart';
import 'package:ecommerce/screens/splash/splash.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => SplashScreen(),
  SignInScreen.routeName : (context) => SignInScreen(),
  ForgotPasswordScreen.routeName : (context) => ForgotPasswordScreen()
};