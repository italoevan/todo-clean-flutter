import 'package:to_do_clean/modules/home/domain/entities/todo.dart';

abstract class TodoDao {
  Future insert(Todo model);
  Future<List<Todo>> read();
  Future removeById(int id);
  Future edit(Todo model);
}
