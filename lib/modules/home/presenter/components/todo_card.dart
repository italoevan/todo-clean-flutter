import 'package:flutter/material.dart';
import 'package:to_do_clean/modules/home/domain/entities/todo.dart';

class TodoCardComponent extends StatelessWidget {
  final Todo todo;
  final VoidCallback? removeTap;
  final VoidCallback? editTap;

  const TodoCardComponent(
      {Key? key, required this.todo, this.editTap, this.removeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        title: Text(todo.description ?? ""),
        leading: IconButton(
            onPressed: editTap,
            icon: const Icon(
              Icons.edit,
              color: Colors.green,
            )),
        trailing: IconButton(
            onPressed: removeTap,
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            )),
      ),
    );
  }
}
