import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];
  final _mybox = Hive.box('mybox');


  //run this if this is the 1st time ever opening this app
  void createInitialData(){
    toDoList = [
      ['open the app', true],
      ['write what you need to do', false]
    ];
  } 
  
  //load the data from database
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }
  
  //update the data
  void updateDataBase(){
    _mybox.put("TODOLIST", toDoList);
  }

}