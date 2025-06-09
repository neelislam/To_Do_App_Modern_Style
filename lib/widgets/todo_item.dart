import 'package:flutter/material.dart';
import 'package:to_do_app_modern_style/constants/color.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: (){

        },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: tdBlue,),
        title: Text('Check Mail', style: TextStyle(fontSize: 16,
        color: tdBlack,
        decoration: TextDecoration.lineThrough
        ),
        ),
      ),
    );
  }
}
