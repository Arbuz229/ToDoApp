import 'package:app_todo/data/database.dart';
import 'package:app_todo/util/dialog_box.dart';
import 'package:app_todo/util/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');
  //list to do tasks
  
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    //create default database if it's the 1st time opennig the app
    if (_mybox.get('TODOLIST') == null){
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }
  //text controller
  final _conroller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([ _conroller.text, false]);
      _conroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
  
void createNewTask() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        onCancel: () => Navigator.of(context).pop(),
        onSave: saveNewTask,
        controller: _conroller,
      );
    },
  );
}

void deliteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
  db.updateDataBase();  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TO DO',
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              isComplited: db.toDoList[index][1],
              taskName: db.toDoList[index][0],
              onChanged: (value) => checkBoxChanged(value, index),
              onDelete: () => deliteTask(index), 
            );
          }),
    );
  }
}
