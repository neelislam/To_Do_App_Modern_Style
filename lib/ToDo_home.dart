import 'package:flutter/material.dart';
import 'package:to_do_app_modern_style/constants/color.dart';
import 'package:to_do_app_modern_style/widgets/todo_item.dart';

class todohomepage extends StatefulWidget {
  const todohomepage({super.key});

  @override
  State<todohomepage> createState() => _todohomepageState();
}

class _todohomepageState extends State<todohomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: AppBar(
        backgroundColor:  tdBgColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Icon(Icons.menu,color: tdBlack, size: 30,),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network('https://images.pexels.com/photos/45201/kitty-cat-kitten-pet-45201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),

            ),
          )
        ],


        ),

      ),
    body: Container(
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
                TodoItem(),

              ],

            ),

          ),

        ],

      ),

    ),
    );
  }
}
