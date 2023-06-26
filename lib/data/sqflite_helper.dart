import 'package:cinema/core/constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {

  late Database db;

  Future initDatabase() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocDir.path, Constants.databaseName);
    db = await openDatabase(
      dbPath,
      version: Constants.version,
      onCreate: (db, version) async {
        await db.execute("create table ${Constants.tableName} ("
            "${Constants.id} integer primary key, "
            "${Constants.title} string,"
            "${Constants.url}  string,"
            ")");
      },
    );
  }

  Future<List<Map<String, dynamic>>> loadAllMovie() async {
    return await db.query(Constants.tableName);
  }

  Future addMovie(Map<String, dynamic> row) async {
    await db.insert(Constants.tableName, row);
  }

  Future updateMovie(Map<String, dynamic> row) async {
    int _id = row[Constants.id];
    await db.update(Constants.tableName,
      row,
      where: '${Constants.id} = ?',
      whereArgs: [_id],
    );
  }

  Future deleteMovie(Map<String, dynamic> row) async {
    int _id = row[Constants.id];
    await db.delete(Constants.tableName,
      where: '${Constants.id} = ?',
      whereArgs: [_id],
    );
  }
}
