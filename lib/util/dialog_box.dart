import 'package:app_todo/util/my_buttons.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onCancel;
  VoidCallback onSave;
  DialogBox({
    super.key,
    required this.controller,
     required this.onCancel,
      required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                //до ввода
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange
                  )
                ),
                //при вводе
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange
                  )
                ),
                hintText: 'Input task'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //кнопка сохранения
                MyButton(text: 'save', onPressed: onSave,),
                const SizedBox(width: 7),
                //кнопка удаления
                MyButton(text: 'cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
