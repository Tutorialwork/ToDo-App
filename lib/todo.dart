import 'package:flutter/material.dart';

import 'checkbox.dart';

class TodoItem extends StatefulWidget {

  final String name;
  final bool isActive;

  const TodoItem({Key key, this.name, this.isActive}) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(widget.name, style: TextStyle(fontSize: 17, color: Colors.grey),),
        Check(isActive: widget.isActive,)
      ],
    );
  }
}
