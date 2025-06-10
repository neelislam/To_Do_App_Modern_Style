import 'package:flutter/material.dart';
import 'package:to_do_app_modern_style/constants/color.dart';
import 'package:to_do_app_modern_style/widgets/todo_item.dart';

import 'model/todo_model.dart';


class todohomepage extends StatefulWidget {

  todohomepage({super.key});

  @override
  State<todohomepage> createState() => _todohomepageState();
}


class _todohomepageState extends State<todohomepage> {
  // These should be defined within the State class, or accessed via widget.
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];


  @override
  void initState(){
    super.initState(); // Always call super.initState() first
    _foundToDo = todosList; // Initialize _foundToDo here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.menu, color: tdBlack, size: 30,),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                    'https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),

              ),
            )
          ],


        ),

      ),
      body: Stack(
          children: [ Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value), // Add onChanged to TextField
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(Icons.search,
                          color: tdBlack,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(
                          maxHeight: 20, minWidth: 25,
                        ),
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, bottom: 20),
                        child: Text('All ToDos', style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold),),
                      ),

                      // Now accessing _foundToDo directly as it's part of the State
                      for (ToDo todoo in _foundToDo.reversed)
                        TodoItem(todo: todoo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,),
                    ],
                  ),
                ),
              ],
            ),
          ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.0,
                          blurRadius: 10.0,
                          offset: Offset(
                              0.0, 0.0), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (value)=>  _runFilter(value),
                      controller: _todoController, // Access directly
                      decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none,
                      ),
                    ),

                  ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(onPressed: (){_addToDoItem(
                        _todoController.text);}, // Access directly

                        style: ElevatedButton.styleFrom(
                          backgroundColor: tdBlue,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        )

                        , child:
                        Text('+',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,

                          ),)),
                  )
                ],
              ),
            )
          ]
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }


  void _deleteToDoItem(String id){
    setState(() {
      // Access todosList directly as it's part of the State
      todosList.removeWhere((item)=> item.id == id);
      _foundToDo = todosList; // Update _foundToDo after deletion
    });
  }


  void _addToDoItem(String toDo){
    setState(() {
      // Access todosList directly
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),todoText: toDo));
      _foundToDo = todosList; // Update _foundToDo after adding
    });
    _todoController.clear(); // Access directly
  }


  void _runFilter(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todosList; // Access directly
    }
    else{
      results = todosList.where((item)=> item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList(); // Access directly
    }

    setState(() {
      _foundToDo = results;
    });
  }
}