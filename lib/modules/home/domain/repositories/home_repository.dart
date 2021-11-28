import '../entities/todo.dart';

abstract class HomeRepository {
 Future<List<Todo>> read();
 Future insert(Todo model);
  Future edit(Todo model);
  Future removeById(int id);
}
