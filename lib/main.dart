import 'package:covid19flutterapp/ui/MainHomeScreen.dart';
import 'package:covid19flutterapp/ui/Splash_Screen.dart';
import 'package:covid19flutterapp/ui/StateInfoScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Covid 19 Track",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        MainHomeScreen.id: (context) => MainHomeScreen(),
        StateInfoScreen.id: (context) => StateInfoScreen(),
      },
    );
  }
}
