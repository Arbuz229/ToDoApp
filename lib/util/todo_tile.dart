import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoList extends StatelessWidget {
  final String taskName;
  final bool isComplited;
  Function(bool?)? onChanged;
  final Function()? onDelete;

  ToDoList(
      {super.key,
      required this.isComplited,
      required this.onChanged,
      required this.taskName,
      required this.onDelete
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 25, top: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Checkbox(
              value: isComplited,
              onChanged: onChanged,
              activeColor: Colors.black
              ),
            Expanded(child: 
              Text(
               taskName,
                style: TextStyle(
                  fontSize: 24,
                  decoration: isComplited
                      ? TextDecoration.lineThrough
                      : TextDecoration.none
                  ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete), // Иконка удаления
              color: Colors.red,
              onPressed: onDelete, // Вызов функции удаления при нажатии
            ),
          ],
        ),
      ),
    );
  }
}
