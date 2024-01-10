import 'package:flutter/material.dart';
import 'package:mongoflutterjs/components/custom_surfix_icon.dart';
import 'package:mongoflutterjs/screens/login/loginscreens.dart';
import 'package:mongoflutterjs/size_config.dart';
import 'package:mongoflutterjs/Api/configAPI.dart';
import 'package:mongoflutterjs/utils/constants.dart';
import 'package:dio/dio.dart';

class Registform extends StatefulWidget {
  @override
  _Registform createState() => _Registform();
}

class _Registform extends State<Registform> {
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? namalengkap;
  String? email;

  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController(),
      txtNamalengkap = TextEditingController(),
      txtEmail = TextEditingController();

  FocusNode focusNode = new FocusNode();

  Response? response;
  var dio = Dio();

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
        SizedBox(
          height: 20,
        ),
        buildNamalengkap(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        SizedBox(
          height: 20,
        ),
        buildEmail(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              prosesRegistrasi(txtUsername.text, txtPassword.text,
                  txtNamalengkap.text, txtEmail.text);
            },
            child: Text(
              "Masuk",
              style: TextStyle(backgroundColor: kPrimaryColor),
            )),
        SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
            child: Text(
              "Sudah Punya Akun ? Masuk Disini ",
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

  TextFormField buildNamalengkap() {
    return TextFormField(
      controller: txtNamalengkap,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Nama Lengkap',
        hintText: 'Masukan Nama Lengkap Anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.emailAddress,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Masukan Email Anda',
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  void prosesRegistrasi(username, password, namalengkap, email) async {
    print(response!.data);

    utilsApps.showDialog(context);
    bool status;
    // ignore: unused_local_variable
    var msg;

    try {
      response = await dio.post(urlRegister, data: {
        'username': username,
        'password': password,
        'nama': namalengkap,
        'email': email
      });

      status = response!.data['sukses'];
      msg = response!.data['msg'];
      if (status) {
        print("Berhasil Registrasi");
        utilsApps.hideDialog(context);
        Navigator.pushNamed(context, LoginScreen.routeName);
      } else {
        print("Gagal Registrasi");
        utilsApps.hideDialog(context);
      }
    } catch (e) {}
  }
}
