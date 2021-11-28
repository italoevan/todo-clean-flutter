import 'package:sqflite/sqflite.dart';

abstract class AppDatabase {
     Future<Database> getDatabase(
      {String? onCreate, required databaseName});
}
