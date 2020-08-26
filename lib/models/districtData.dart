import 'package:covid19flutterapp/models/delta.dart';

class District {
  String district;
  String notes;
  int active;
  int confirmed;
  int deceased;
  int recovered;
  Delta delta;

  District.fromJSON(results) {
    district = results["district"];
    notes = results["notes"];
    active = results["active"];
    confirmed = results["confirmed"];
    deceased = results["deceased"];
    recovered = results["recovered"];
    delta = Delta.fromJSON(results["delta"]);
  }
}
