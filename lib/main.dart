import 'package:flutter/material.dart';
import 'package:login_page_3/home_page.dart';
import 'package:login_page_3/signup_page.dart';
import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/' :(context) => LoginPage(),
      'signup_page': (context) => SignupPage(),
      'home_page': (context) =>HomePage(),
    },
  ));
}



