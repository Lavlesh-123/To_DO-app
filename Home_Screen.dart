import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Screens/SignupScreen.dart';
import 'package:todoapp/utills/Toast.dart';
import 'package:todoapp/utills/dialog_box.dart';
import 'package:todoapp/utills/drawer.dart';
import 'package:todoapp/utills/todoList.dart';

class HomePage extends StatefulWidget{
  const HomePage ({super.key});

@override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final _controller  = TextEditingController();
  var auth = FirebaseAuth.instance;

  List todoList = [
  ["Study",false],
   ["Exercise",false],
  ];
  //checkbox was tapped
  void checkBoxChanged(bool? value ,int index){
    setState(() {
      todoList[index][1]= !todoList[index][1];
    });
  }
  // save new task
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  // create a new task
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return
        DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () =>Navigator.of(context).pop(),
      );
    },
    );
  }
  // delete task
  void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
         centerTitle: true,
        title:Text('To Do'),
        elevation: 0,

      ),
      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,child: Icon(Icons.add),

      ),

      drawer: MyDrawer(),

      body:
      ListView.builder(
          itemCount: todoList.length,
          itemBuilder:(context,index){
            return ToDoList(
                taskName: todoList[index][0],
                onChanged:(value)=>checkBoxChanged(value , index),
                taskCompleted: todoList[index][1],
            deleteFunction: (context) => deleteTask(index),);
          })
    );
  }
}