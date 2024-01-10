import 'package:flutter/material.dart';
import 'package:mongoflutterjs/routes.dart';
import 'package:mongoflutterjs/screens/login/loginscreens.dart';
import 'package:mongoflutterjs/theme.dart';

void main() async {
  runApp(MaterialApp(
    title: "LIBRARY BOOK",
    theme: theme(),
    initialRoute: LoginScreen.routeName,
    routes: routes,
  ));
}
