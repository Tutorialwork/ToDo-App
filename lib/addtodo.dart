import 'package:flutter/material.dart';

class AddTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green
          ),
          child: Icon(Icons.add, color: Colors.white,),
        )
      ],
    );
  }
}
