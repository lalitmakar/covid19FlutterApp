
import 'package:covid19flutterapp/models/model.dart';

class MainModel {
  List<StateData> states;

  MainModel.fromJSON(List parsedJson) {
    List<StateData> tempList = [];
    for (int i = 0; i < parsedJson.length; i++) {
      StateData temp = StateData.fromJSON(parsedJson[i]);
      tempList.add(temp);
    }

    states = tempList;
  }
}
