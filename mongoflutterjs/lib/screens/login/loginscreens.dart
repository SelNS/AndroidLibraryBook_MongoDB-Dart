import 'package:flutter/material.dart';
import 'package:mongoflutterjs/components/login/logincomponent.dart';
import 'package:mongoflutterjs/size_config.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: loginComponent(),
    );
  }
}
