import 'package:cinema/core/constants.dart';
import 'package:cinema/data/data_model.dart';
import 'package:cinema/data/sqflite_helper.dart';

class DataRepository{

  SqfliteHelper sqfliteHelper  = SqfliteHelper();

  Future initDb()async{
    await sqfliteHelper.initDatabase();
  }

  Future<List<DataModel>> loadAllMovie() async{
  List<DataModel> movieList  = [];
  final response = await sqfliteHelper.loadAllMovie();
  for(final row in response){
    DataModel(
      row[Constants.id] as int,
      row[Constants.title] as String,
      row[Constants.url] as String,
    );
  }
  return movieList;
  }

  Future addMovie(DataModel dataModel) async{
     Map<String, dynamic> row = {
       Constants.title : dataModel.title,
       Constants.url : dataModel.url,
     };
     await sqfliteHelper.addMovie(row);
  }

  Future updateMovie(DataModel dataModel) async{
    Map<String, dynamic> row = {
      Constants.id : dataModel.id,
      Constants.title : dataModel.title,
      Constants.url : dataModel.url,
    };
    await sqfliteHelper.updateMovie(row);
  }

  Future deleteMovie(DataModel dataModel) async{
    Map<String, dynamic> row = {
      Constants.id : dataModel.id,
      Constants.title : dataModel.title,
      Constants.url : dataModel.url,
    };
    await sqfliteHelper.deleteMovie(row);
  }
}