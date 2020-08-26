import 'dart:convert';
import 'package:covid19flutterapp/models/mainModel.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  final String apiUrl =
      "https://api.covid19india.org/v2/state_district_wise.json";

  Future<MainModel> fetchJsonData() async {
    http.Response response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      return MainModel.fromJSON(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
