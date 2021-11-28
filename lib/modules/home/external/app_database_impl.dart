import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../infra/datasource/app_database.dart';

class AppDatabaseImpl implements AppDatabase {
  @override
  Future<Database> getDatabase(
      {String? onCreate, required databaseName}) async {
    String path = join(await getDatabasesPath(), databaseName);

    return openDatabase(path, version: 1, onCreate: (database, v) async {
      await database.execute(onCreate ?? "");
    });
  }
}
