import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/entities/todo.dart';
import '../domain/usecases/crud_usecase.dart';

import 'components/home_dialog.dart';

class HomeController extends GetxController {
  final CrudUsecase _crudUsecase;

  HomeController(this._crudUsecase);

  List<Todo> get todoList => _todoList;

  final _todoList = <Todo>[].obs;

  final _listIsLoading = true.obs;

  bool get isLoading => _listIsLoading.value;

  Future edit(Todo model, String newDescription) async {
    model.description = newDescription;
    await _crudUsecase.edit(model, newDescription);
    _todoList.refresh();
  }

  Future insert(Todo model) async {
    await _crudUsecase.insert(model);
    read();
  }

  Future<List<Todo>> read() async {
    _listIsLoading.value = true;
    _todoList.value = await _crudUsecase.read();
    _listIsLoading.value = false;
    return _todoList;
  }

  void removeById(int id) async {
    await _crudUsecase.removeById(id);
    read();
  }

  void onEditTap(BuildContext context, Todo todo) {
    TextEditingController controller =
        TextEditingController(text: todo.description);

    showDialog(
        context: context,
        builder: (alertContext) {
          return HomeDialogComponent(
              controller: controller,
              onTap: () => edit(todo, controller.text)
                  .then((_) => Navigator.pop(context)),
              buttonText: "Editar");
        });
  }

  void onActionTap(BuildContext context) {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (alertContext) => HomeDialogComponent(
            controller: controller,
            onTap: () => insert(Todo(description: controller.text))
                .then((_) => Navigator.pop(context)),
            buttonText: "Salvar"));
  }
}
