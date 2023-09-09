
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;
  
   ToDoList({
    Key? key,
    required this.taskName,
    required this.onChanged,
    required this.taskCompleted,
     required this.deleteFunction,
  }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,top: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(15),)
          ],
        ),
        child: Container(
          padding:EdgeInsets.all(25) ,
          child: Row(
            children: [
              Checkbox
                (value: taskCompleted,
                  onChanged: onChanged,
                activeColor: Colors.black,
              ),

              Text(
                  taskName,
                style: TextStyle(
                    decoration: taskCompleted
                    ?TextDecoration.lineThrough
                :TextDecoration.none),
              )
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12)
          ),
        ),
      ),
    );
  }
}
