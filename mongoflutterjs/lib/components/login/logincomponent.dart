import 'package:flutter/material.dart';
import 'package:mongoflutterjs/components/login/loginform.dart';
import 'package:mongoflutterjs/size_config.dart';
import 'package:mongoflutterjs/utils/constants.dart';
import 'package:simple_shadow/simple_shadow.dart';

class loginComponent extends StatefulWidget {
  @override
  _logincomponent createState() => _logincomponent();
}

class _logincomponent extends State<loginComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenHeight(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight = 0.04,
              ),
              SizedBox(
                height: SizeConfig.screenHeight = 0.04,
              ),
              SimpleShadow(
                child: Image.asset("assets/images/book.png",
                    height: 150, width: 202),
                opacity: 0.5,
                color: kSecondaryColor,
                offset: Offset(5, 5),
                sigma: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login !",
                      style: mTitleStyle,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Signform()
            ],
          ),
        ),
      ),
    ));
  }
}
