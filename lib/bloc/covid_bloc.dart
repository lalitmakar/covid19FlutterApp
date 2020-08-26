import 'package:covid19flutterapp/models/mainModel.dart';
import 'package:covid19flutterapp/networking/repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = CovidBloc();

class CovidBloc {
  Repository _repo = new Repository();

  BehaviorSubject<MainModel> _dataFetcher = new BehaviorSubject<MainModel>();

  Stream<MainModel> get covidData => _dataFetcher.stream;

  fetchDataBloc() async {
    MainModel model = await _repo.fetchData();
    _dataFetcher.sink.add(model);
  }

  dispose() {
    _dataFetcher.close();
  }
}
