
import 'package:covid19flutterapp/models/districtData.dart';

class StateData {
  String state;
  String statecode;
  List<District> districtData;

  StateData.fromJSON(Map results) {
    state = results["state"];
    statecode = results["statecode"];

    List<District> temp = [];

    for (int i = 0; i < results["districtData"].length; i++) {
      District district = District.fromJSON(results["districtData"][i]);
      temp.add(district);
    }

    districtData = temp;
  }
}
