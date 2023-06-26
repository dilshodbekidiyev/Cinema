import 'package:cinema/data/data_model.dart';
import 'package:cinema/data/data_repository.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  List<DataModel> _movieList = [];
  DataRepository dataRepository = DataRepository();

  AppProvider() {
    initDB();
  }

  List<DataModel> get movieList => _movieList;

  set movieList(List<DataModel> value) {
    _movieList = value;
    notifyListeners();
  }

  Future loadAllMovie() async {
    _movieList = await dataRepository.loadAllMovie();
  }

  Future addMovie({required String title, required String url}) async {
    final movie = DataModel(1, title, url);
    await dataRepository.addMovie(movie);
    loadAllMovie();
  }

  Future updateMovie(DataModel dataModel) async {
    await dataRepository.addMovie(dataModel);
    loadAllMovie();
  }

  Future deleteMovie(DataModel dataModel) async {
    await dataRepository.addMovie(dataModel);
    loadAllMovie();
  }

  void initDB() async{
    await dataRepository.initDb().then((value) => loadAllMovie());
  }
}
