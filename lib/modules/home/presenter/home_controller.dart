import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_clean/modules/home/presenter/components/home_dialog.dart';
import '../domain/entities/todo.dart';
import '../domain/repositories/home_repository.dart';
import 'package:flutter/material.dart';

abstract class HomeController {
  bool get isLoading;
  List<Todo> get todoList;
  Future insert(Todo model);
  Future<void> read();
  void removeById(int id);
  Future edit(Todo model, String newDescription);
  void onEditTap(BuildContext context, Todo todo);
  void onActionTap(BuildContext context);
}

class HomeControllerImpl extends GetxController implements HomeController {
  final HomeRepository repository;
  HomeControllerImpl(this.repository);

  @override
  List<Todo> get todoList => _todoList;

  var _todoList = <Todo>[].obs;

  var _listIsLoading = true.obs;

  bool get isLoading => _listIsLoading.value;

  @override
  Future edit(Todo model, String newDescription) async {
    model.description = newDescription;
    await repository.edit(model);
    _todoList.refresh();
  }

  @override
  Future insert(Todo model) async {
    await repository.insert(model);
    read();
  }

  @override
  Future<void> read() async {
    _listIsLoading.value = true;
    _todoList.value = await repository.read();
    _listIsLoading.value = false;
  }

  @override
  void removeById(int id) async {
    await repository.removeById(id);
    read();
  }

  @override
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

  @override
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
