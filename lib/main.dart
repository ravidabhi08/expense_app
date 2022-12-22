import 'package:app_expanse/pages/Home_page.dart';
import 'package:app_expanse/pages/about.dart';
import 'package:app_expanse/pages/forgot_password.dart';
import 'package:app_expanse/pages/login.dart';
import 'package:app_expanse/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:app_expanse/pages/add _expanse.dart';
import 'package:app_expanse/pages/view_expanse.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'password': (context) => MyPassword(),
      'home': (context) => MyHomePage(),
      'add_expanse': (context) => AddExpanse(),
      'view_expanse': (context) => ViewExpanse(),
      'about': (context) => About()
    },
  ));
}