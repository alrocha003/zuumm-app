import 'package:flutter/material.dart';
import 'package:zuumm_app/Screens/Delivery/routedelivery-screen.dart';
import 'package:zuumm_app/Screens/Home/home-screen.dart';
import 'package:zuumm_app/Screens/Login/initial-screen.dart';
import 'package:zuumm_app/Screens/Login/login-screen.dart';
import 'package:zuumm_app/Screens/Login/signup-screen.dart';
import 'package:zuumm_app/Screens/Signup/driverregister-screen.dart';
import 'package:zuumm_app/Screens/Signup/initialquestion-screen.dart';
import 'package:zuumm_app/Screens/Signup/userregister-screen.dart';
import 'Screens/Splash/splash.dart';

void main() async {
  runApp(MaterialApp(
    title: 'Zuumm App',
    theme: ThemeData(
      primaryColor: Colors.orange,
      accentColor: Colors.orangeAccent,
      backgroundColor: Colors.orange[700],
      inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/initial': (context) => InitialScreen(),
      '/Login': (context) => LoginScreen(),
      '/Signup': (context) => SignupScreen(),
      '/Initial': (context) => InitialQuestionScreen(),
      '/Home': (context) => HomeScreen(),
      '/DriverRegister': (context) => DriverRegisterScreen(),
      '/UserRegister': (context) => UserRegisterScreen(),
      '/RouteDelivery': (context) => RouteDeliveryScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
