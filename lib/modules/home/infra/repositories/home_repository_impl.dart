import '../../domain/entities/todo.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasource/todo_dao.dart';

class HomeRepositoryImpl implements HomeRepository {
  final TodoDao dao;
  HomeRepositoryImpl(this.dao);

  @override
  Future removeById(int id) async {
    await dao.removeById(id);
  }

  @override
  Future insert(Todo model) async {
    await dao.insert(model);
  }

  @override
  Future<List<Todo>> read() async {
    return await dao.read();
  }

  @override
  Future edit(Todo model) async {
    await dao.edit(model);
  }
}
