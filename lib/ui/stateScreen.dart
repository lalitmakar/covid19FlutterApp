import 'package:covid19flutterapp/constants.dart';
import 'package:covid19flutterapp/models/mainModel.dart';
import 'package:covid19flutterapp/ui/StateInfoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_text/gradient_text.dart';

class StatesListWidget extends StatefulWidget {
  final MainModel model;
  StatesListWidget({this.model});

  @override
  _StatesListWidgetState createState() => _StatesListWidgetState();
}

class _StatesListWidgetState extends State<StatesListWidget> {
  int confirmedCal = 0;
  int activeCal = 0;
  int deceasedCal = 0;
  int recoveredCal = 0;

  @override
  void initState() {
    super.initState();
    cal(widget.model.states);
  }

  void cal(List states) async {
    for (var state in states) {
      for (var district in state.districtData) {
        activeCal += district.active;
        confirmedCal += district.confirmed;
        deceasedCal += district.deceased;
        recoveredCal += district.recovered;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                color: Color(0xff473F97),
                width: double.infinity,
                child: Card(
                  elevation: 20.0,
                  color: Color(0xff473F97),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Covid in ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        GradientText("INDIA",
                            gradient: LinearGradient(colors: [
                              Colors.orange,
                              Colors.white,
                              Colors.green
                            ]),
                            style: TextStyle(
                              fontSize: 42,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SpinKitRipple(
                      borderWidth: 20.0,
                      color: Colors.redAccent,
                    ),
                    Text(
                      "LIVE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff473F97),
                ),
                padding: EdgeInsets.only(left: 30.0, bottom: 30.0, right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffF7A326),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$activeCal',
                                    style: kFiguresStyle,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Active Cases",
                                    textAlign: TextAlign.center,
                                    style: kFiguresStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff4CB5FF),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$confirmedCal',
                                    style: kFiguresStyle,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Confirmed Cases",
                                    textAlign: TextAlign.center,
                                    style: kFiguresStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff0FE69A),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$recoveredCal',
                                    style: kFiguresStyle,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "Recovered Cases",
                                    textAlign: TextAlign.center,
                                    style: kFiguresStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xffFF5959),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 30.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '$deceasedCal',
                                    style: kFiguresStyle,
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    ""
                                    "Deceased Cases",
                                    textAlign: TextAlign.center,
                                    style: kFiguresStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Color(0xff473F97),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: widget.model.states.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                widget.model.states[index].state,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StateInfoScreen(
                                      state: widget.model.states[index],
                                    ),
                                  ),
                                ));
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
