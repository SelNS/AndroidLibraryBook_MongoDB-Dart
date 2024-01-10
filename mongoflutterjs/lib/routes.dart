import 'package:flutter/material.dart';
// import 'package:mongoflutterjs/screens/buku/Crud/inputbukuscreen.dart';
// import 'package:mongoflutterjs/screens/buku/homebukuscreen.dart';
import 'package:mongoflutterjs/screens/login/loginscreens.dart';
import 'package:mongoflutterjs/screens/register/registerscreen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen()
  // HomeBookScreen.routeName: (context) => HomeBookScreen(),
  // InputBukuScreens.routeName: (context) => InputBukuScreens()
};
