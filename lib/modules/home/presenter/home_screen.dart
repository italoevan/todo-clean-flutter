import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:to_do_clean/modules/home/domain/entities/todo.dart';
import 'package:to_do_clean/modules/home/presenter/components/todo_card.dart';
import 'package:to_do_clean/modules/home/presenter/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ModularState<HomeScreen, HomeController> {
  @override
  void initState() {
    controller.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do App"),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading
          ? Center(
              child: CircularProgressIndicator(),
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
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.onActionTap(context),
        child: Text("Add"),
      ),
    );
  }
}
