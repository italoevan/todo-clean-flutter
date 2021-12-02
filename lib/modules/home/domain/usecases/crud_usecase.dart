import 'package:get/get.dart';
import '../repositories/home_repository.dart';
import '../entities/todo.dart';

abstract class CrudUsecase {
  Future insert(Todo model);
  Future<List<Todo>> read();
  Future removeById(int id);
  Future edit(Todo model, String newDescription);
}

class CrudImplementation extends GetxController implements CrudUsecase {
  final HomeRepository repository;
  CrudImplementation(this.repository);

  @override
  Future edit(Todo model, String newDescription) async {
    await repository.edit(model);
  }

  @override
  Future insert(Todo model) async {
    await repository.insert(model);
  }

  @override
  Future<List<Todo>> read() async {
    List<Todo> list = [];
    list = await repository.read();
    return list;
  }

  @override
  Future<void> removeById(int id) async {
    await repository.removeById(id);
    read();
  }
}
