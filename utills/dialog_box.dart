import 'package:flutter/material.dart';
import 'package:todoapp/utills/my_button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave
  });

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.yellow.shade400,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),
              hintText:'Add a new task'),

            ),
            //buttons => save+cancel
            Row(
              children: [
                // save button
                MyButton(
                    text: 'Save', onPressed: onSave
                ),
                SizedBox(
                  height: 60,
                  width: 50,),
                //cancel button
                MyButton(
                    text: 'Cancel',onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
