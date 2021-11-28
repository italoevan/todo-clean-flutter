import 'package:sqflite/sqflite.dart';
import '../domain/entities/todo.dart';
import '../infra/datasource/app_database.dart';
import '../infra/datasource/todo_dao.dart';

class TodoDaoImpl implements TodoDao {
  final AppDatabase appDatabaseImpl;
  TodoDaoImpl(this.appDatabaseImpl);

  static const String tableName = "todo";

  static const String _onCreate =
      "CREATE TABLE $tableName (id INTEGER PRIMARY KEY,description TEXT, dateTime TEXT) ";

  @override
  Future insert(Todo model) async {
    Database database = await appDatabaseImpl.getDatabase(
      databaseName: tableName,
      onCreate: TodoDaoImpl._onCreate,
    );

    await database.insert(tableName, model.toMap());
  }

  @override
  Future<List<Todo>> read() async {
    Database database = await appDatabaseImpl.getDatabase(
      databaseName: tableName,
      onCreate: TodoDaoImpl._onCreate,
    );

    List<Map<String, dynamic>> response = await database.query(tableName);

    List<Todo> list = [];

    for (var element in response) {
      list.add(Todo.fromMap(element));
    }

    list.sort();

    return list;
  }

  @override
  Future removeById(int id) async {
    Database database = await appDatabaseImpl.getDatabase(
        databaseName: tableName, onCreate: _onCreate);
    await database.rawDelete("DELETE FROM $tableName WHERE ID = ?", [id]);

    return;
  }

  @override
  Future edit(Todo model) async {
    Database database = await appDatabaseImpl.getDatabase(
        databaseName: tableName, onCreate: _onCreate);
    await database.rawUpdate(
        "UPDATE $tableName SET description = ? WHERE id = ?",
        [model.description, model.id]);
    return;
  }
}
