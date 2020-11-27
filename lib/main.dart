import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/navbar.dart';
import 'package:todo_app/todo.dart';

void main(){
  runApp(MaterialApp(home: HomePage(),));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map<String, dynamic> todo = {};
  TextEditingController _controller = new TextEditingController();
  
  @override
  void initState() {
    _loadData();
  }
  
  _loadData() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (storage.getString('todo') != null) {
      todo = jsonDecode(storage.getString('todo'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Todo'
                      ),
                    ),
                    actions: [
                      FlatButton(
                        child: Text('Speichern'),
                        onPressed: () {
                          Navigator.pop(context);
                          _addTodo();
                        },
                      )
                    ],
                  );
                }
              );
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
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
              ),
            ),
          ),
          body: Column(
            children: [
              Navbar(),
              SizedBox(height: 30,),
              Expanded(
                child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context, i) {
                    return Dismissible(
                      key: Key('item'+i.toString()),
                      onDismissed: (direction) {
                        todo.remove(todo.keys.elementAt(i));
                        _save();
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            todo[todo.keys.elementAt(i)] = !todo[todo.keys.elementAt(i)];
                          });
                          _save();
                        },
                        child: TodoItem(name: todo.keys.elementAt(i), isActive: todo.values.elementAt(i)),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  _addTodo() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (_controller.text.length > 0) {
      setState(() {
        todo.putIfAbsent(_controller.text, () => false);
        storage.setString('todo', jsonEncode(todo));
      });
    }
  }

  _save() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString('todo', jsonEncode(todo));
  }
}
