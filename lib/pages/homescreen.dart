import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test1/utils/todo_list.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final _controller = TextEditingController();
  List todoList = [
    ['Learn Flutter', false],
    ['Learn PHP', false],
    ['Learn C#', true],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void addtask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
  }
void deletetask(int index){
    setState(() {
      todoList.removeAt(index);
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text("Todo List"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskname: todoList[index][0],
            taskcomplete: todoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (value) => deletetask(index),
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new todo list here',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black
                    ),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.deepPurple
                      ),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ),
            ),
          ),
           FloatingActionButton(
            onPressed: addtask,
            child: Icon(Icons.add),
            backgroundColor: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}
