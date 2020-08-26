import 'package:covid19flutterapp/bloc/covid_bloc.dart';
import 'package:covid19flutterapp/models/mainModel.dart';
import 'package:covid19flutterapp/ui/stateScreen.dart';
import 'package:flutter/material.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class MainHomeScreen extends StatefulWidget {
  static final String id = "MainScreen";

  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  var confirmedCal;
  var activeCal;
  var deceasedCal;
  var recoveredCal;

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> _exitAppCallback() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Do you want to exit this app ?"),
              elevation: 10.0,
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("No"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                FlatButton(
                  onPressed: () {
                    bloc.dispose();
                    Navigator.pop(context, false);
                  },
                  child: Text("Yes"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchDataBloc();
    return WillPopScope(
      onWillPop: _exitAppCallback,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0xff473F97),
        body: StreamBuilder(
            stream: bloc.covidData,
            builder: (context, AsyncSnapshot<MainModel> snapshot) {
              if (snapshot.hasData) {
                return StatesListWidget(
                  model: snapshot.data,
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error.toString()}');
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
