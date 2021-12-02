import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import '../domain/entities/todo.dart';
import 'components/todo_card.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  void initState() {
    controller.read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do App"),
        centerTitle: true,
      ),
      body: Obx(() => _listOfTodo()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onActionTap(context),
        child: Text("Add"),
      ),
    );
  }

  Widget _listOfTodo() {
    return controller.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : controller.todoList.isEmpty
            ? Center(
                child: Text("Empty List"),
              )
            : ListView.builder(
                itemCount: controller.todoList.length,
                itemBuilder: (context, index) {
                  Todo todo = controller.todoList[index];
                  return TodoCardComponent(
                    todo: todo,
                    removeTap: () => controller.removeById(todo.id!),
                    editTap: () => controller.onEditTap(context, todo),
                  );
                });
  }
}
