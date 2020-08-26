import 'package:covid19flutterapp/models/mainModel.dart';
import 'package:covid19flutterapp/networking/api_provider.dart';

class Repository {
  ApiProvider appapiProvider = new ApiProvider();

  Future<MainModel> fetchData() => appapiProvider.fetchJsonData();
}
