import 'package:flutter/material.dart';
import 'screens/MainScreen.dart';
import 'screens/tab/homeScreen.dart';
import 'screens/splashScreen.dart';
import 'screens/loginScreen.dart';

var routes = <String, WidgetBuilder>{
  "/": (context) => SplashScreen(),
  "/Login": (context) => LoginScreen(),
  "/Home": (context) => HomeScreen(),
  "/Main": (context) => MainScreen(),
};
