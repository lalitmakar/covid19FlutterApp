import 'dart:async';
import 'package:covid19flutterapp/bloc/covid_bloc.dart';
import 'package:covid19flutterapp/ui/MainHomeScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static final String id = "Splash_Screen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    bloc.fetchDataBloc();
    Timer(Duration(seconds: 3), () {
      Navigator.pop(context);
      Navigator.pushNamed(context, MainHomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(
                  "images/corona.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Covid 19",
                      style: TextStyle(
                        fontSize: 50.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Stay Home | Stay Safe",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SpinKitWave(
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
