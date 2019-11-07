import 'package:flutter/material.dart';
import 'package:zuumm_app/Screens/Home/home-screen.dart';
import 'package:zuumm_app/Screens/Login/initial-screen.dart';
import 'package:zuumm_app/Screens/Login/login-screen.dart';
import 'package:zuumm_app/Screens/Login/signup-screen.dart';
import 'Screens/Splash/splash.dart';

void main() => runApp(MaterialApp(
    title: 'Vruumm App',
    theme: ThemeData(
        primaryColor: Colors.orange, 
        accentColor: Colors.orangeAccent 
        ),
    initialRoute: '/',
    routes: {
      '/initial': (context) => InitialScreen(),
      '/Login': (context) => LoginScreen(),
      '/Signup': (context) => SignupScreen()
    },
    debugShowCheckedModeBanner: false,
    home: HomeScreen()));
