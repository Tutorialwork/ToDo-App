import 'package:flutter/material.dart';
import 'package:todo_app/addtodo.dart';
import 'package:todo_app/checkbox.dart';
import 'package:todo_app/navbar.dart';
import 'package:todo_app/todo.dart';

void main(){
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: AddTodo(),
          body: Column(
            children: [
              Navbar(),
              SizedBox(height: 30,),
              TodoItem(name: "Hallo Welt", isActive: false),
              SizedBox(height: 10,),
              TodoItem(name: "Hallo Welt hashddddddddddddddddddddddddddddddds", isActive: true),
              SizedBox(height: 10,),
              TodoItem(name: "Hallo", isActive: true),
            ],
          )
        ),
      ),
    );
  }
}
