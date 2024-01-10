import 'package:flutter/material.dart';
import 'package:mongoflutterjs/components/register/registercomponent.dart';
import 'package:mongoflutterjs/size_config.dart';

class RegisterScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegisterComponent(),
    );
  }
}
