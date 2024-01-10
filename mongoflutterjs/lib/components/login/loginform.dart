import 'package:flutter/material.dart';
import 'package:mongoflutterjs/components/custom_surfix_icon.dart';
import 'package:mongoflutterjs/screens/register/registerscreen.dart';
import 'package:mongoflutterjs/size_config.dart';
import 'package:mongoflutterjs/utils/constants.dart';

class Signform extends StatefulWidget {
  @override
  _Signform createState() => _Signform();
}

class _Signform extends State<Signform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;
  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildUsername(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        SizedBox(
          height: 20,
        ),
        buildPassword(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Row(
          children: [
            Checkbox(
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }),
            Text("Tetap Masuk"),
            Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ))
          ],
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "Masuk",
              style: TextStyle(backgroundColor: kPrimaryColor),
            )),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar Disini ",
              style: TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    ));
  }

  TextFormField buildUsername() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan Username Anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan Password Anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }
}
