import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const kAnimationDuration = Duration(milliseconds: 200);

const String EMPTY_PASSWORD_ERROR = "Please enter your password";
const String EMPTY_EMAIL_ERROR = "Please enter your email";
const String EMAIL_INVALID_ERROR = "Email is invalid";
final RegExp emailRegExp = RegExp("/\S+@\S+\.\S+/");